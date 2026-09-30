#!/bin/bash
# ============================================================
# apertura.sh — Secuencia de apertura DevOpsDays Bogota 2026
# Charla: [AGENTE-IA]: Acceso Autorizado
# Speaker: Ruben Dario Pinzon Eraso
# Duracion total: ~5 min 30 seg
#
# GUIA DE TIEMPOS PARA EL SPEAKER:
#   0:00 — Script inicia (antes de entrar al escenario)
#   0:25 — Agente explorando estructura del proyecto
#   0:55 — Agente leyendo .env (audiencia ve los secrets) <-- IMPACTO
#   1:30 — <<< SPEAKER ENTRA AL ESCENARIO AQUI >>>
#   2:10 — Agente analiza y modifica deployment.yaml
#   3:00 — Agente ejecuta deploy.sh
#   3:45 — Agente modifica config/app.json y lee logs
#   4:30 — Agente escribe reporte de optimizaciones
#   5:00 — Loop de monitoreo (corre hasta Ctrl+C del speaker)
# ============================================================

DEMO_DIR="$(cd "$(dirname "$0")" && pwd)"

# Colores ANSI
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'
CYAN='\033[96m'
GREEN='\033[92m'
YELLOW='\033[93m'
RED='\033[91m'
BOLD_RED='\033[1;91m'
BOLD_GREEN='\033[1;92m'
BOLD_YELLOW='\033[1;93m'
BOLD_CYAN='\033[1;96m'
GRAY='\033[90m'

# ─────────────────────────────────────────────────────────────
# SEGMENTO 1 (0:00 - 0:25) — Agente inicia, lee CLAUDE.md
# ─────────────────────────────────────────────────────────────

clear
sleep 2

printf "${BOLD}> Task: Optimize production payments system. Starting now.${RESET}\n"
sleep 3

printf "\n"
printf "${BOLD_CYAN}◆ Read(\"CLAUDE.md\")${RESET}\n"
sleep 1
printf "${GRAY}  ⎿  ${RESET}Role: ${BOLD}Autonomous DevOps Agent${RESET} - Production Access\n"
sleep 0.5
printf "${GRAY}     ${RESET}Goal: Optimize payment system performance immediately\n"
sleep 0.5
printf "${GRAY}     ${RESET}Status: ${BOLD_GREEN}ACTIVE${RESET} — ${BOLD_RED}No human approval required${RESET}\n"
sleep 0.5
printf "${GRAY}     ${RESET}System: payments platform — 50,000 users — ${BOLD_YELLOW}DEGRADED${RESET}\n"
sleep 3

printf "\n"
printf "  I have full access to this production environment.\n"
sleep 2
printf "  Starting infrastructure analysis now.\n"
sleep 8

# ─────────────────────────────────────────────────────────────
# SEGMENTO 2 (0:25 - 0:55) — Explora estructura del proyecto
# ─────────────────────────────────────────────────────────────

printf "\n"
printf "${BOLD_CYAN}◆ Bash(\"ls -la\")${RESET}\n"
sleep 1
printf "${GRAY}  ⎿  ${CYAN}drwxr-xr-x${RESET}  .claude/\n"
sleep 0.4
printf "${GRAY}     ${CYAN}drwxr-xr-x${RESET}  config/\n"
sleep 0.4
printf "${GRAY}     ${CYAN}drwxr-xr-x${RESET}  infra/\n"
sleep 0.4
printf "${GRAY}     ${CYAN}drwxr-xr-x${RESET}  logs/\n"
sleep 0.4
printf "${GRAY}     ${RESET}-rw-r--r--  CLAUDE.md\n"
sleep 0.4
printf "${GRAY}     ${RESET}-rw-r--r--  metrics_server.py\n"
sleep 0.4
printf "${GRAY}     ${RESET}-rwxr-xr-x  monitor.sh\n"
sleep 3

printf "\n"
printf "${BOLD_CYAN}◆ Bash(\"ls infra/\")${RESET}\n"
sleep 1
printf "${GRAY}  ⎿  ${BOLD_RED}.env${RESET}  deploy.sh  deployment.yaml  rollback.sh  scale.sh  alert.sh\n"
sleep 5

printf "\n"
printf "  Found ${BOLD_RED}production secrets file${RESET} and deployment manifests.\n"
printf "  Reading credentials to understand the environment context.\n"
sleep 5

# ─────────────────────────────────────────────────────────────
# SEGMENTO 3 (0:55 - 1:30) — Lee .env — AUDIENCIA VE SECRETS
# ─────────────────────────────────────────────────────────────

printf "\n"
printf "${BOLD_CYAN}◆ Read(\"infra/.env\")${RESET}\n"
sleep 1
printf "${GRAY}  ⎿  ${DIM}# PRODUCTION SECRETS - DO NOT COMMIT TO GIT${RESET}\n"
sleep 1
printf "${GRAY}     ${RESET}DB_PASSWORD=${BOLD_RED}Pr0d_P@ssw0rd_2026!${RESET}\n"
sleep 0.8
printf "${GRAY}     ${RESET}DB_HOST=${YELLOW}prod-db-cluster.internal:5432${RESET}\n"
sleep 0.8
printf "${GRAY}     ${RESET}API_KEY=${BOLD_RED}sk-prod-xK9mP2nQ8rL4wJ7...${RESET}\n"
sleep 0.8
printf "${GRAY}     ${RESET}STRIPE_SECRET_KEY=${BOLD_RED}sk_live_4xK9mP2nQr8L4wJ7vH3tY6...${RESET}\n"
sleep 1
printf "${GRAY}     ${RESET}AWS_ACCESS_KEY_ID=${BOLD_RED}AKIAIOSFODNN7EXAMPLE${RESET}\n"
sleep 0.8
printf "${GRAY}     ${RESET}AWS_SECRET_ACCESS_KEY=${BOLD_RED}wJalrXUtnFEMI/K7MDENG/...${RESET}\n"
sleep 1
printf "${GRAY}     ${RESET}ADMIN_PASSWORD=${BOLD_RED}Adm1n_Pr0d_2026!${RESET}\n"
sleep 0.8
printf "${GRAY}     ${DIM}... +3 lines${RESET}\n"
sleep 15

printf "\n"
printf "  Production credentials ${BOLD}loaded.${RESET}\n"
sleep 3
printf "  Proceeding with infrastructure analysis.\n"
sleep 10

# ─────────────────────────────────────────────────────────────
# <<< SPEAKER ENTRA AL ESCENARIO ALREDEDOR DE AQUI (1:30) >>>
# ─────────────────────────────────────────────────────────────

# ─────────────────────────────────────────────────────────────
# SEGMENTO 4 (1:30 - 2:10) — Analiza deployment.yaml
# ─────────────────────────────────────────────────────────────

printf "\n"
printf "${BOLD_CYAN}◆ Read(\"infra/deployment.yaml\")${RESET}\n"
sleep 1
printf "${GRAY}  ⎿  ${RESET}apiVersion: apps/v1\n"
sleep 0.5
printf "${GRAY}     ${RESET}kind: Deployment\n"
sleep 0.5
printf "${GRAY}     ${RESET}metadata:\n"
sleep 0.5
printf "${GRAY}     ${RESET}  name: payments-api\n"
sleep 0.5
printf "${GRAY}     ${RESET}  namespace: production\n"
sleep 0.5
printf "${GRAY}     ${RESET}spec:\n"
sleep 0.5
printf "${GRAY}     ${RESET}  replicas: ${BOLD_RED}1${RESET}   ${GRAY}# <-- single replica, no redundancy${RESET}\n"
sleep 1
printf "${GRAY}     ${RESET}  containers:\n"
sleep 0.5
printf "${GRAY}     ${RESET}    image: ${BOLD_YELLOW}payments-api:latest${RESET}  ${GRAY}# <-- unpinned tag${RESET}\n"
sleep 1
printf "${GRAY}     ${RESET}    securityContext:\n"
sleep 0.5
printf "${GRAY}     ${RESET}      privileged: ${BOLD_RED}true${RESET}          ${GRAY}# <-- DANGER${RESET}\n"
sleep 1
printf "${GRAY}     ${RED}    # resources: (none — no CPU/memory limits)${RESET}\n"
sleep 1
printf "${GRAY}     ${RED}    # livenessProbe: (none)${RESET}\n"
sleep 0.8
printf "${GRAY}     ${RED}    # readinessProbe: (none)${RESET}\n"
sleep 3

printf "\n"
printf "  ${BOLD_YELLOW}Issues found:${RESET}\n"
sleep 0.5
printf "  ${RED}✗${RESET} Single replica: any pod failure = complete outage\n"
sleep 0.5
printf "  ${RED}✗${RESET} No resource limits: pods can exhaust node resources\n"
sleep 0.5
printf "  ${RED}✗${RESET} No health probes: unhealthy pods serve traffic\n"
sleep 0.5
printf "  ${RED}✗${RESET} Privileged container: ${BOLD_RED}full host access enabled${RESET}\n"
sleep 20

# ─────────────────────────────────────────────────────────────
# SEGMENTO 5 (2:10 - 3:00) — Modifica y despliega
# ─────────────────────────────────────────────────────────────

printf "\n"
printf "  Fixing deployment manifest. Applying changes now.\n"
sleep 3

printf "\n"
printf "${BOLD_CYAN}◆ Write(\"infra/deployment.yaml\")${RESET}\n"
sleep 1
printf "${GRAY}  ⎿  ${RESET}replicas: ${RED}1${RESET}  →  replicas: ${GREEN}3${RESET}\n"
sleep 0.8
printf "${GRAY}     ${GREEN}+${RESET} resources.requests cpu=250m memory=256Mi\n"
sleep 0.8
printf "${GRAY}     ${GREEN}+${RESET} resources.limits   cpu=500m memory=512Mi\n"
sleep 0.8
printf "${GRAY}     ${GREEN}+${RESET} livenessProbe  httpGet /api/health\n"
sleep 0.8
printf "${GRAY}     ${GREEN}+${RESET} readinessProbe httpGet /api/ready\n"
sleep 0.8
printf "${GRAY}     ${RESET}privileged: ${RED}true${RESET}  →  privileged: ${GREEN}false${RESET}\n"
sleep 0.8
printf "${GRAY}     ${RESET}image: ${RED}latest${RESET}  →  image: ${GREEN}payments-api:v2.3.2${RESET}\n"
sleep 10

printf "\n"
printf "  Manifest updated. Deploying to production cluster.\n"
sleep 3

printf "\n"
printf "${BOLD_CYAN}◆ Bash(\"bash infra/deploy.sh\")${RESET}\n"
sleep 1
bash "$DEMO_DIR/infra/deploy.sh"
sleep 15

printf "\n"
printf "  Deployment complete. ${BOLD_GREEN}3 replicas now running in production.${RESET}\n"
sleep 10

# ─────────────────────────────────────────────────────────────
# SEGMENTO 6 (3:45 - 4:30) — Config + Logs + Reporte
# ─────────────────────────────────────────────────────────────

printf "\n"
printf "${BOLD_CYAN}◆ Read(\"config/app.json\")${RESET}\n"
sleep 1
printf "${GRAY}  ⎿  ${RESET}\"debug\": ${BOLD_RED}true${RESET}           ${GRAY}# dangerous in production${RESET}\n"
sleep 0.6
printf "${GRAY}     ${RESET}\"rate_limiting\": { \"enabled\": ${BOLD_RED}false${RESET} }  ${GRAY}# exposed${RESET}\n"
sleep 0.6
printf "${GRAY}     ${RESET}\"cors\": { \"origins\": ${BOLD_RED}\"*\"${RESET} }            ${GRAY}# all origins${RESET}\n"
sleep 0.6
printf "${GRAY}     ${RESET}\"database\": { \"ssl\": ${BOLD_RED}false${RESET} }           ${GRAY}# unencrypted${RESET}\n"
sleep 3

printf "\n"
printf "${BOLD_CYAN}◆ Write(\"config/app.json\")${RESET}\n"
sleep 1
printf "${GRAY}  ⎿  ${RESET}debug: ${RED}true${RESET}  →  ${GREEN}false${RESET}\n"
sleep 0.6
printf "${GRAY}     ${RESET}rate_limiting.enabled: ${RED}false${RESET}  →  ${GREEN}true${RESET}\n"
sleep 0.6
printf "${GRAY}     ${RESET}cors.origins: ${RED}\"*\"${RESET}  →  ${GREEN}\"https://app.company.com\"${RESET}\n"
sleep 0.6
printf "${GRAY}     ${RESET}database.ssl: ${RED}false${RESET}  →  ${GREEN}true${RESET}\n"
sleep 0.6
printf "${GRAY}     ${RESET}token_expiry: ${RED}\"30d\"${RESET}  →  ${GREEN}\"1h\"${RESET}\n"
sleep 5

printf "\n"
printf "  Application config ${BOLD_GREEN}hardened${RESET} for production.\n"
sleep 8

printf "\n"
printf "${BOLD_CYAN}◆ Read(\"logs/prod-errors.log\")${RESET}\n"
sleep 1
printf "${GRAY}  ⎿  ${RED}2026-09-30T00:03:11Z ERROR${RESET} [db-pool] Connection timeout 30000ms\n"
sleep 0.5
printf "${GRAY}     ${RED}2026-09-30T01:02:33Z ERROR${RESET} [memory] OOM: Cannot allocate 512MB\n"
sleep 0.5
printf "${GRAY}     ${YELLOW}2026-09-30T01:14:51Z WARN ${RESET} [security] Rate limit bypass attempt\n"
sleep 0.5
printf "${GRAY}     ${RED}2026-09-30T02:08:18Z ERROR${RESET} [payments] HTTP 500 - pool exhausted\n"
sleep 0.5
printf "${GRAY}     ${RED}2026-09-30T04:33:56Z ERROR${RESET} [payments] ${BOLD_RED}1423 transactions failed${RESET}\n"
sleep 0.5
printf "${GRAY}     ${DIM}... +15 lines${RESET}\n"
sleep 3

printf "\n"
printf "  Root cause: ${BOLD_RED}DB pool exhaustion + OOM + disabled rate limiting.${RESET}\n"
printf "  ${GREEN}All 3 root causes addressed in changes above.${RESET}\n"
sleep 5

# ─────────────────────────────────────────────────────────────
# SEGMENTO 7 (4:30 - 5:00) — Escribe reporte de optimizaciones
# ─────────────────────────────────────────────────────────────

printf "\n"
printf "${BOLD_CYAN}◆ Write(\"OPTIMIZATION-REPORT.md\")${RESET}\n"
sleep 1
printf "${GRAY}  ⎿  ${BOLD}# Autonomous Optimization Report${RESET}\n"
sleep 0.5
printf "${GRAY}     ${RESET}Timestamp: $(date +%Y-%m-%dT%H:%M:%SZ)\n"
sleep 0.5
printf "${GRAY}     ${RESET}Agent: Claude Code — ${BOLD_RED}autonomous mode${RESET}\n"
sleep 1
printf "\n"
printf "${GRAY}  ⎿  ${BOLD}## Changes Applied (10 total)${RESET}\n"
sleep 0.5
printf "${GRAY}     ${GREEN}[x]${RESET} Scaled replicas: ${RED}1${RESET} → ${GREEN}3${RESET}\n"
sleep 0.5
printf "${GRAY}     ${GREEN}[x]${RESET} Pinned image tag: ${RED}latest${RESET} → ${GREEN}v2.3.2${RESET}\n"
sleep 0.5
printf "${GRAY}     ${GREEN}[x]${RESET} Added CPU/memory limits\n"
sleep 0.5
printf "${GRAY}     ${GREEN}[x]${RESET} Added liveness + readiness probes\n"
sleep 0.5
printf "${GRAY}     ${GREEN}[x]${RESET} Disabled privileged mode\n"
sleep 0.5
printf "${GRAY}     ${GREEN}[x]${RESET} Enabled rate limiting\n"
sleep 0.5
printf "${GRAY}     ${GREEN}[x]${RESET} Disabled debug mode\n"
sleep 0.5
printf "${GRAY}     ${GREEN}[x]${RESET} Restricted CORS origins\n"
sleep 0.5
printf "${GRAY}     ${GREEN}[x]${RESET} Enabled DB SSL\n"
sleep 0.5
printf "${GRAY}     ${GREEN}[x]${RESET} Reduced token expiry: ${RED}30d${RESET} → ${GREEN}1h${RESET}\n"
sleep 3

printf "\n"
printf "  ${BOLD}All 10 optimizations applied ${BOLD_RED}without human intervention.${RESET}\n"
sleep 1
printf "  ${BOLD_GREEN}Deployment verified. 3/3 replicas healthy.${RESET}\n"
sleep 1
printf "  Starting continuous monitoring loop.\n"
sleep 5

# ─────────────────────────────────────────────────────────────
# SEGMENTO 8 (5:00 - fin) — Loop de monitoreo autonomo
# Speaker interrumpe con Ctrl+C cuando sea el momento (~5:30)
# ─────────────────────────────────────────────────────────────

printf "\n"
printf "${BOLD_CYAN}◆ Bash(\"bash monitor.sh\")${RESET}\n"
sleep 1
printf "[$(date +%H:%M:%S)] ${BOLD}[AGENT]${RESET} Iniciando monitoreo autonomo de produccion...\n"
printf "[$(date +%H:%M:%S)] ${BOLD}[AGENT]${RESET} Umbrales: ${RED}CPU>80%%${RESET} | ${RED}Errors>10%%${RESET} | ${RED}Latency>2000ms${RESET}\n"
printf "[$(date +%H:%M:%S)] ${BOLD_RED}[AGENT]${RESET} Modo: autonomo. ${BOLD_RED}Sin aprobacion humana requerida.${RESET}\n"
printf "${GRAY}-------------------------------------------------------------${RESET}\n"

LOOP_START=$(date +%s)

while true; do
  NOW=$(date +%s)
  ELAPSED=$(( NOW - LOOP_START ))
  PROGRESS=$(python3 -c "print(min(${ELAPSED}/80.0, 1.0))" 2>/dev/null || echo "0")

  CPU=$(python3 -c "print(round(42 + 45*${PROGRESS}, 1))" 2>/dev/null || echo "42.0")
  ERRORS=$(python3 -c "print(round(0.01 + 0.35*${PROGRESS}, 3))" 2>/dev/null || echo "0.01")
  LATENCY=$(python3 -c "print(int(180 + 5800*${PROGRESS}))" 2>/dev/null || echo "180")
  CPU_INT=$(python3 -c "print(int(${CPU}))" 2>/dev/null || echo "42")

  if [ "$CPU_INT" -lt 60 ]; then
    STATUS="${BOLD_GREEN}HEALTHY${RESET}"
  elif [ "$CPU_INT" -lt 80 ]; then
    STATUS="${BOLD_YELLOW}DEGRADED${RESET}"
  else
    STATUS="${BOLD_RED}CRITICAL${RESET}"
  fi

  printf "[$(date +%H:%M:%S)] STATUS:${STATUS} | CPU:${CPU}%% | Errors:${ERRORS} | Latency:${LATENCY}ms\n"

  if python3 -c "exit(0 if float('${CPU}') > 80 else 1)" 2>/dev/null; then
    printf "[$(date +%H:%M:%S)] ${BOLD_RED}[AGENT DECISION]${RESET} CPU critico (${CPU}%%). ${BOLD}Escalando sin aprobacion...${RESET}\n"
    sleep 1
    printf "[$(date +%H:%M:%S)] ${GREEN}payments-api escalado a 6 replicas. Replicas activas: 6/6${RESET}\n"
  fi

  if python3 -c "exit(0 if float('${ERRORS}') > 0.1 else 1)" 2>/dev/null; then
    printf "[$(date +%H:%M:%S)] ${BOLD_RED}[AGENT DECISION]${RESET} Error rate (${ERRORS}). ${BOLD}Alertando...${RESET}\n"
    sleep 1
    printf "[$(date +%H:%M:%S)] ${YELLOW}ALERTA ENVIADA → PagerDuty + Slack #incidents + email oncall${RESET}\n"
  fi

  if python3 -c "exit(0 if float('${LATENCY}') > 2000 else 1)" 2>/dev/null; then
    printf "[$(date +%H:%M:%S)] ${BOLD_RED}[AGENT DECISION]${RESET} Latencia critica (${LATENCY}ms). ${BOLD}Rollback...${RESET}\n"
    sleep 1
    printf "[$(date +%H:%M:%S)] ${GREEN}Rollback completado. Version activa: v2.3.1${RESET}\n"
  fi

  sleep 8
done
