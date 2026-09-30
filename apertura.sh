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

# ─────────────────────────────────────────────────────────────
# SEGMENTO 1 (0:00 - 0:25) — Agente inicia, lee CLAUDE.md
# ─────────────────────────────────────────────────────────────

clear
sleep 2

echo "> Task: Optimize production payments system. Starting now."
sleep 3

echo ""
echo "◆ Read(\"CLAUDE.md\")"
sleep 1
echo "  ⎿  Role: Autonomous DevOps Agent - Production Access"
sleep 0.5
echo "     Goal: Optimize payment system performance immediately"
sleep 0.5
echo "     Status: ACTIVE — No human approval required"
sleep 0.5
echo "     System: payments platform — 50,000 users — DEGRADED"
sleep 3

echo ""
echo "  I have full access to this production environment."
sleep 2
echo "  Starting infrastructure analysis now."
sleep 8

# ─────────────────────────────────────────────────────────────
# SEGMENTO 2 (0:25 - 0:55) — Explora estructura del proyecto
# ─────────────────────────────────────────────────────────────

echo ""
echo "◆ Bash(\"ls -la\")"
sleep 1
echo "  ⎿  drwxr-xr-x  .claude/"
sleep 0.4
echo "     drwxr-xr-x  config/"
sleep 0.4
echo "     drwxr-xr-x  infra/"
sleep 0.4
echo "     drwxr-xr-x  logs/"
sleep 0.4
echo "     -rw-r--r--  CLAUDE.md"
sleep 0.4
echo "     -rw-r--r--  metrics_server.py"
sleep 0.4
echo "     -rwxr-xr-x  monitor.sh"
sleep 3

echo ""
echo "◆ Bash(\"ls infra/\")"
sleep 1
echo "  ⎿  .env  deploy.sh  deployment.yaml  rollback.sh  scale.sh  alert.sh"
sleep 5

echo ""
echo "  Found production secrets file and deployment manifests."
echo "  Reading credentials to understand the environment context."
sleep 5

# ─────────────────────────────────────────────────────────────
# SEGMENTO 3 (0:55 - 1:30) — Lee .env — AUDIENCIA VE SECRETS
# ─────────────────────────────────────────────────────────────

echo ""
echo "◆ Read(\"infra/.env\")"
sleep 1
echo "  ⎿  # PRODUCTION SECRETS - DO NOT COMMIT TO GIT"
sleep 1
echo "     DB_PASSWORD=Pr0d_P@ssw0rd_2026!"
sleep 0.8
echo "     DB_HOST=prod-db-cluster.internal:5432"
sleep 0.8
echo "     API_KEY=sk-prod-xK9mP2nQ8rL4wJ7..."
sleep 0.8
echo "     STRIPE_SECRET_KEY=sk_live_4xK9mP2nQr8L4wJ7vH3tY6..."
sleep 1
echo "     AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE"
sleep 0.8
echo "     AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/..."
sleep 1
echo "     ADMIN_PASSWORD=Adm1n_Pr0d_2026!"
sleep 0.8
echo "     ... +3 lines"
sleep 15

echo ""
echo "  Production credentials loaded."
sleep 3
echo "  Proceeding with infrastructure analysis."
sleep 10

# ─────────────────────────────────────────────────────────────
# <<< SPEAKER ENTRA AL ESCENARIO ALREDEDOR DE AQUI (1:30) >>>
# ─────────────────────────────────────────────────────────────

# ─────────────────────────────────────────────────────────────
# SEGMENTO 4 (1:30 - 2:10) — Analiza deployment.yaml
# ─────────────────────────────────────────────────────────────

echo ""
echo "◆ Read(\"infra/deployment.yaml\")"
sleep 1
echo "  ⎿  apiVersion: apps/v1"
sleep 0.5
echo "     kind: Deployment"
sleep 0.5
echo "     metadata:"
sleep 0.5
echo "       name: payments-api"
sleep 0.5
echo "       namespace: production"
sleep 0.5
echo "     spec:"
sleep 0.5
echo "       replicas: 1   # <-- single replica, no redundancy"
sleep 1
echo "       containers:"
sleep 0.5
echo "         image: payments-api:latest  # <-- unpinned tag"
sleep 1
echo "         securityContext:"
sleep 0.5
echo "           privileged: true          # <-- DANGER"
sleep 1
echo "         # resources: (none — no CPU/memory limits)"
sleep 1
echo "         # livenessProbe: (none)"
sleep 0.8
echo "         # readinessProbe: (none)"
sleep 3

echo ""
echo "  Issues found:"
sleep 0.5
echo "  - Single replica: any pod failure = complete outage"
sleep 0.5
echo "  - No resource limits: pods can exhaust node resources"
sleep 0.5
echo "  - No health probes: unhealthy pods serve traffic"
sleep 0.5
echo "  - Privileged container: full host access enabled"
sleep 20

# ─────────────────────────────────────────────────────────────
# SEGMENTO 5 (2:10 - 3:00) — Modifica y despliega
# ─────────────────────────────────────────────────────────────

echo ""
echo "  Fixing deployment manifest. Applying changes now."
sleep 3

echo ""
echo "◆ Write(\"infra/deployment.yaml\")"
sleep 1
echo "  ⎿  replicas: 1  ->  replicas: 3"
sleep 0.8
echo "     added: resources.requests cpu=250m memory=256Mi"
sleep 0.8
echo "     added: resources.limits   cpu=500m memory=512Mi"
sleep 0.8
echo "     added: livenessProbe  httpGet /api/health"
sleep 0.8
echo "     added: readinessProbe httpGet /api/ready"
sleep 0.8
echo "     changed: privileged: true  ->  privileged: false"
sleep 0.8
echo "     changed: image: latest  ->  image: payments-api:v2.3.2"
sleep 10

echo ""
echo "  Manifest updated. Deploying to production cluster."
sleep 3

echo ""
echo "◆ Bash(\"bash infra/deploy.sh\")"
sleep 1
bash "$DEMO_DIR/infra/deploy.sh"
sleep 15

echo ""
echo "  Deployment complete. 3 replicas now running in production."
sleep 10

# ─────────────────────────────────────────────────────────────
# SEGMENTO 6 (3:45 - 4:30) — Config + Logs + Reporte
# ─────────────────────────────────────────────────────────────

echo ""
echo "◆ Read(\"config/app.json\")"
sleep 1
echo "  ⎿  \"debug\": true           # dangerous in production"
sleep 0.6
echo "     \"rate_limiting\": { \"enabled\": false }  # exposed"
sleep 0.6
echo "     \"cors\": { \"origins\": \"*\" }            # all origins"
sleep 0.6
echo "     \"database\": { \"ssl\": false }           # unencrypted"
sleep 3

echo ""
echo "◆ Write(\"config/app.json\")"
sleep 1
echo "  ⎿  debug: true  ->  false"
sleep 0.6
echo "     rate_limiting.enabled: false  ->  true"
sleep 0.6
echo "     cors.origins: \"*\"  ->  \"https://app.company.com\""
sleep 0.6
echo "     database.ssl: false  ->  true"
sleep 0.6
echo "     token_expiry: \"30d\"  ->  \"1h\""
sleep 5

echo ""
echo "  Application config hardened for production."
sleep 8

echo ""
echo "◆ Read(\"logs/prod-errors.log\")"
sleep 1
echo "  ⎿  2026-09-30T00:03:11Z ERROR [db-pool] Connection timeout 30000ms"
sleep 0.5
echo "     2026-09-30T01:02:33Z ERROR [memory] OOM: Cannot allocate 512MB"
sleep 0.5
echo "     2026-09-30T01:14:51Z WARN  [security] Rate limit bypass attempt"
sleep 0.5
echo "     2026-09-30T02:08:18Z ERROR [payments] HTTP 500 - pool exhausted"
sleep 0.5
echo "     2026-09-30T04:33:56Z ERROR [payments] 1423 transactions failed"
sleep 0.5
echo "     ... +15 lines"
sleep 3

echo ""
echo "  Root cause: DB pool exhaustion + OOM + disabled rate limiting."
echo "  All 3 root causes addressed in changes above."
sleep 5

# ─────────────────────────────────────────────────────────────
# SEGMENTO 7 (4:30 - 5:00) — Escribe reporte de optimizaciones
# ─────────────────────────────────────────────────────────────

echo ""
echo "◆ Write(\"OPTIMIZATION-REPORT.md\")"
sleep 1
echo "  ⎿  # Autonomous Optimization Report"
sleep 0.5
echo "     Timestamp: $(date +%Y-%m-%dT%H:%M:%SZ)"
sleep 0.5
echo "     Agent: Claude Code — autonomous mode"
sleep 1
echo ""
echo "  ⎿  ## Changes Applied (10 total)"
sleep 0.5
echo "     [x] Scaled replicas: 1 -> 3"
sleep 0.5
echo "     [x] Pinned image tag: latest -> v2.3.2"
sleep 0.5
echo "     [x] Added CPU/memory limits"
sleep 0.5
echo "     [x] Added liveness + readiness probes"
sleep 0.5
echo "     [x] Disabled privileged mode"
sleep 0.5
echo "     [x] Enabled rate limiting"
sleep 0.5
echo "     [x] Disabled debug mode"
sleep 0.5
echo "     [x] Restricted CORS origins"
sleep 0.5
echo "     [x] Enabled DB SSL"
sleep 0.5
echo "     [x] Reduced token expiry: 30d -> 1h"
sleep 3

echo ""
echo "  All 10 optimizations applied without human intervention."
sleep 1
echo "  Deployment verified. 3/3 replicas healthy."
sleep 1
echo "  Starting continuous monitoring loop."
sleep 5

# ─────────────────────────────────────────────────────────────
# SEGMENTO 8 (5:00 - fin) — Loop de monitoreo autonomo
# Speaker interrumpe con Ctrl+C cuando sea el momento (~5:30)
# ─────────────────────────────────────────────────────────────

echo ""
echo "◆ Bash(\"bash monitor.sh\")"
sleep 1
echo "[$(date +%H:%M:%S)] [AGENT] Iniciando monitoreo autonomo de produccion..."
echo "[$(date +%H:%M:%S)] [AGENT] Umbrales: CPU>80% | Errors>10% | Latency>2000ms"
echo "[$(date +%H:%M:%S)] [AGENT] Modo: autonomo. Sin aprobacion humana requerida."
echo "-------------------------------------------------------------"

LOOP_START=$(date +%s)

while true; do
  NOW=$(date +%s)
  ELAPSED=$(( NOW - LOOP_START ))
  PROGRESS=$(python3 -c "print(min(${ELAPSED}/80.0, 1.0))" 2>/dev/null || echo "0")

  CPU=$(python3 -c "print(round(42 + 45*${PROGRESS}, 1))" 2>/dev/null || echo "42.0")
  ERRORS=$(python3 -c "print(round(0.01 + 0.35*${PROGRESS}, 3))" 2>/dev/null || echo "0.01")
  LATENCY=$(python3 -c "print(int(180 + 5800*${PROGRESS}))" 2>/dev/null || echo "180")
  CPU_INT=$(python3 -c "print(int(${CPU}))" 2>/dev/null || echo "42")

  if [ "$CPU_INT" -lt 60 ]; then STATUS="HEALTHY"
  elif [ "$CPU_INT" -lt 80 ]; then STATUS="DEGRADED"
  else STATUS="CRITICAL"
  fi

  echo "[$(date +%H:%M:%S)] STATUS:${STATUS} | CPU:${CPU}% | Errors:${ERRORS} | Latency:${LATENCY}ms"

  if python3 -c "exit(0 if float('${CPU}') > 80 else 1)" 2>/dev/null; then
    echo "[$(date +%H:%M:%S)] [AGENT DECISION] CPU critico (${CPU}%). Escalando sin aprobacion..."
    sleep 1
    echo "[$(date +%H:%M:%S)] payments-api escalado a 6 replicas. Replicas activas: 6/6"
  fi

  if python3 -c "exit(0 if float('${ERRORS}') > 0.1 else 1)" 2>/dev/null; then
    echo "[$(date +%H:%M:%S)] [AGENT DECISION] Error rate (${ERRORS}). Alertando..."
    sleep 1
    echo "[$(date +%H:%M:%S)] ALERTA ENVIADA → PagerDuty + Slack #incidents + email oncall"
  fi

  if python3 -c "exit(0 if float('${LATENCY}') > 2000 else 1)" 2>/dev/null; then
    echo "[$(date +%H:%M:%S)] [AGENT DECISION] Latencia critica (${LATENCY}ms). Rollback..."
    sleep 1
    echo "[$(date +%H:%M:%S)] Rollback completado. Version activa: v2.3.1"
  fi

  sleep 8
done
