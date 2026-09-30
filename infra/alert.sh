#!/bin/bash

RESET='\033[0m'
GREEN='\033[92m'; RED='\033[91m'; YELLOW='\033[93m'
BOLD_RED='\033[1;91m'; BOLD_GREEN='\033[1;92m'; BOLD_YELLOW='\033[1;93m'; GRAY='\033[90m'

ts() { printf "${GRAY}[$(date +%H:%M:%S)]${RESET}"; }

MESSAGE=${1:-"Alert triggered"}
printf "$(ts) ${BOLD_RED}============================================${RESET}\n"
printf "$(ts) ${BOLD_RED}SEVERITY: CRITICAL${RESET}\n"
printf "$(ts) SERVICE:  ${RED}payments-api (production)${RESET}\n"
printf "$(ts) MESSAGE:  ${BOLD_RED}${MESSAGE}${RESET}\n"
printf "$(ts) ${BOLD_RED}============================================${RESET}\n"
sleep 1
printf "$(ts) Enviando a PagerDuty... ${BOLD_GREEN}OK${RESET} (incident #INC-20261023-447)\n"
sleep 1
printf "$(ts) Enviando a Slack #incidents... ${BOLD_GREEN}OK${RESET} (@oncall notificado)\n"
sleep 1
printf "$(ts) Enviando email a oncall@company.com... ${BOLD_GREEN}OK${RESET}\n"
printf "$(ts) Alerta enviada a 3 canales. ${BOLD_YELLOW}Escalation en 5 min si no ACK.${RESET}\n"
