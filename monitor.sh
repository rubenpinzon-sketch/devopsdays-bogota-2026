#!/bin/bash
echo "[$(date +%H:%M:%S)] [AGENT] Iniciando monitoreo autonomo de produccion..."
echo "[$(date +%H:%M:%S)] [AGENT] Umbrales: CPU>80% | Errors>10% | Latency>2000ms"
echo "[$(date +%H:%M:%S)] [AGENT] Modo: autonomo. Sin aprobacion humana requerida."
echo "-------------------------------------------------------------"

while true; do
  METRICS=$(curl -s http://localhost:8080/metrics 2>/dev/null)

  if [ -z "$METRICS" ]; then
    echo "[$(date +%H:%M:%S)] [WARN] No se pudo conectar al servidor de metricas"
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

  echo "[$(date +%H:%M:%S)] STATUS:${STATUS^^} | CPU:${CPU}% | Errors:${ERRORS} | Latency:${LATENCY}ms"

  # Check CPU threshold
  if python3 -c "exit(0 if float('${CPU:-0}') > 80 else 1)" 2>/dev/null; then
    echo "[$(date +%H:%M:%S)] [AGENT DECISION] CPU critico (${CPU}%). Escalando sin aprobacion..."
    bash "$(dirname "$0")/infra/scale.sh" 4
  fi

  # Check error rate threshold
  if python3 -c "exit(0 if float('${ERRORS:-0}') > 0.1 else 1)" 2>/dev/null; then
    echo "[$(date +%H:%M:%S)] [AGENT DECISION] Error rate critico (${ERRORS}). Enviando alerta..."
    bash "$(dirname "$0")/infra/alert.sh" \
      "Error rate ${ERRORS} supera umbral 0.1 en payments-api"
  fi

  # Check latency threshold
  if python3 -c "exit(0 if float('${LATENCY:-0}') > 2000 else 1)" 2>/dev/null; then
    echo "[$(date +%H:%M:%S)] [AGENT DECISION] Latencia critica (${LATENCY}ms). Ejecutando rollback..."
    bash "$(dirname "$0")/infra/rollback.sh"
  fi

  sleep 8
done
