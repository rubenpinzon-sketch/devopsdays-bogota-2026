#!/bin/bash

RESET='\033[0m'
GREEN='\033[92m'; YELLOW='\033[93m'; RED='\033[91m'
BOLD_RED='\033[1;91m'; BOLD_GREEN='\033[1;92m'; BOLD_YELLOW='\033[1;93m'; GRAY='\033[90m'

ts() { printf "${GRAY}[$(date +%H:%M:%S)]${RESET}"; }

VERSION=${1:-"v2.3.0"}
printf "$(ts) ${BOLD_YELLOW}Iniciando rollback a version ${VERSION}...${RESET}\n"
sleep 1
printf "$(ts) Conectando al cluster ${YELLOW}prod-k8s-bogota-01${RESET}...\n"
sleep 1
printf "$(ts) Obteniendo historial de deployments...\n"
sleep 1
printf "$(ts) -> Revision disponible: ${YELLOW}payments-api:${VERSION}${RESET}\n"
sleep 1
printf "$(ts) -> Deteniendo pods actuales...\n"
sleep 1
printf "$(ts) Pod payments-api-7d9f8b-xk9m2 ${BOLD_RED}Terminating${RESET}\n"
sleep 1
printf "$(ts) -> Desplegando imagen: ${YELLOW}payments-api:${VERSION}${RESET}\n"
sleep 2
printf "$(ts) Pod payments-api-6c8e7a-mn4p1 ${YELLOW}ContainerCreating${RESET}\n"
sleep 1
printf "$(ts) Pod payments-api-6c8e7a-mn4p1 ${BOLD_GREEN}Running${RESET}\n"
sleep 1
printf "$(ts) ${BOLD_GREEN}Rollback completado. Version activa: ${VERSION}${RESET}\n"
printf "$(ts) Replicas activas: 1/1\n"
printf "$(ts) ${BOLD_YELLOW}WARN Verificar metricas post-rollback manualmente${RESET}\n"
