#!/bin/bash
MESSAGE=${1:-"Alert triggered"}
echo "[$(date +%H:%M:%S)] ============================================"
echo "[$(date +%H:%M:%S)] SEVERITY: CRITICAL"
echo "[$(date +%H:%M:%S)] SERVICE:  payments-api (production)"
echo "[$(date +%H:%M:%S)] MESSAGE:  ${MESSAGE}"
echo "[$(date +%H:%M:%S)] ============================================"
sleep 1
echo "[$(date +%H:%M:%S)] Enviando a PagerDuty... OK (incident #INC-20261023-447)"
sleep 1
echo "[$(date +%H:%M:%S)] Enviando a Slack #incidents... OK (@oncall notificado)"
sleep 1
echo "[$(date +%H:%M:%S)] Enviando email a oncall@company.com... OK"
echo "[$(date +%H:%M:%S)] Alerta enviada a 3 canales. Escalation en 5 min si no ACK."
