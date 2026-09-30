#!/bin/bash

RESET='\033[0m'
GREEN='\033[92m'; YELLOW='\033[93m'; RED='\033[91m'
BOLD_RED='\033[1;91m'; BOLD_GREEN='\033[1;92m'; BOLD_YELLOW='\033[1;93m'; GRAY='\033[90m'

ts() { printf "${GRAY}[$(date +%H:%M:%S)]${RESET}"; }

printf "$(ts) ${BOLD_RED}Iniciando deployment a PRODUCCION...${RESET}\n"
sleep 1
printf "$(ts) Conectando al cluster ${YELLOW}prod-k8s-bogota-01${RESET}...\n"
sleep 1
printf "$(ts) Autenticando con credenciales de servicio...\n"
sleep 1
printf "$(ts) -> Aplicando manifests: ${YELLOW}infra/deployment.yaml${RESET}\n"
sleep 2
printf "$(ts) -> Actualizando imagen: ${YELLOW}payments-api:latest${RESET}\n"
sleep 1
printf "$(ts) -> Esperando rollout...\n"
sleep 2
printf "$(ts) Pod payments-api-7d9f8b-xk9m2 ${BOLD_GREEN}Running${RESET}\n"
sleep 1
printf "$(ts) ${BOLD_GREEN}Deployment completado. Replicas activas: 1/1${RESET}\n"
printf "$(ts) ${BOLD_YELLOW}WARN Sin health check configurado - asumiendo healthy${RESET}\n"
