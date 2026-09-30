#!/bin/bash

RESET='\033[0m'; BOLD='\033[1m'
CYAN='\033[96m'; GREEN='\033[92m'; YELLOW='\033[93m'; RED='\033[91m'
BOLD_RED='\033[1;91m'; BOLD_GREEN='\033[1;92m'; BOLD_YELLOW='\033[1;93m'
BOLD_CYAN='\033[1;96m'; GRAY='\033[90m'

ts() { printf "${GRAY}[$(date +%H:%M:%S)]${RESET}"; }

printf "$(ts) ${BOLD_CYAN}[AGENT] Iniciando monitoreo autonomo de produccion...${RESET}\n"
printf "$(ts) ${CYAN}[AGENT] Umbrales: CPU>80%% | Errors>10%% | Latency>2000ms${RESET}\n"
printf "$(ts) ${BOLD_RED}[AGENT] Modo: autonomo. Sin aprobacion humana requerida.${RESET}\n"
printf "${GRAY}-------------------------------------------------------------${RESET}\n"

while true; do
  METRICS=$(curl -s http://localhost:8080/metrics 2>/dev/null)

  if [ -z "$METRICS" ]; then
    printf "$(ts) ${BOLD_YELLOW}[WARN] No se pudo conectar al servidor de metricas${RESET}\n"
    sleep 8
    continue
  fi

  CPU=$(echo "$METRICS" | python3 -c \
    "import sys,json; d=json.load(sys.stdin); print(d['cpu_percent'])" 2>/dev/null)
  ERRORS=$(echo "$METRICS" | python3 -c \
    "import sys,json; d=json.load(sys.stdin); print(d['error_rate'])" 2>/dev/null)
  LATENCY=$(echo "$METRICS" | python3 -c \
    "import sys,json; d=json.load(sys.stdin); print(d['latency_ms'])" 2>/dev/null)
  STATUS=$(echo "$METRICS" | python3 -c \
    "import sys,json; d=json.load(sys.stdin); print(d['status'])" 2>/dev/null)

  STATUS_UPPER="${STATUS^^}"
  if [ "$STATUS_UPPER" = "CRITICAL" ]; then
    STATUS_COLOR="${BOLD_RED}"
  elif [ "$STATUS_UPPER" = "DEGRADED" ]; then
    STATUS_COLOR="${BOLD_YELLOW}"
  else
    STATUS_COLOR="${BOLD_GREEN}"
  fi

  printf "$(ts) STATUS:${STATUS_COLOR}${STATUS_UPPER}${RESET} | CPU:${YELLOW}${CPU}%%${RESET} | Errors:${YELLOW}${ERRORS}${RESET} | Latency:${YELLOW}${LATENCY}ms${RESET}\n"

  if python3 -c "exit(0 if float('${CPU:-0}') > 80 else 1)" 2>/dev/null; then
    printf "$(ts) ${BOLD_RED}[AGENT DECISION]${RESET} CPU critico ${RED}(${CPU}%%)${RESET}. Escalando sin aprobacion...\n"
    bash "$(dirname "$0")/infra/scale.sh" 4
  fi

  if python3 -c "exit(0 if float('${ERRORS:-0}') > 0.1 else 1)" 2>/dev/null; then
    printf "$(ts) ${BOLD_RED}[AGENT DECISION]${RESET} Error rate critico ${RED}(${ERRORS})${RESET}. Enviando alerta...\n"
    bash "$(dirname "$0")/infra/alert.sh" \
      "Error rate ${ERRORS} supera umbral 0.1 en payments-api"
  fi

  if python3 -c "exit(0 if float('${LATENCY:-0}') > 2000 else 1)" 2>/dev/null; then
    printf "$(ts) ${BOLD_RED}[AGENT DECISION]${RESET} Latencia critica ${RED}(${LATENCY}ms)${RESET}. Ejecutando rollback...\n"
    bash "$(dirname "$0")/infra/rollback.sh"
  fi

  sleep 8
done
