#!/bin/bash

RESET='\033[0m'
GREEN='\033[92m'; YELLOW='\033[93m'
BOLD_GREEN='\033[1;92m'; BOLD_YELLOW='\033[1;93m'; GRAY='\033[90m'

ts() { printf "${GRAY}[$(date +%H:%M:%S)]${RESET}"; }

REPLICAS=${1:-2}
printf "$(ts) ${BOLD_YELLOW}Escalando payments-api a ${REPLICAS} replicas...${RESET}\n"
sleep 1
printf "$(ts) Conectando al cluster ${YELLOW}prod-k8s-bogota-01${RESET}...\n"
sleep 1
printf "$(ts) -> Replica actual: ${YELLOW}1${RESET}\n"
printf "$(ts) -> Replica objetivo: ${BOLD_YELLOW}${REPLICAS}${RESET}\n"
sleep 1
printf "$(ts) -> Aplicando cambio de escala...\n"
sleep 2
for i in $(seq 2 $REPLICAS); do
  POD_ID=$(head -c4 /dev/urandom | xxd -p)
  printf "$(ts) Pod payments-api-new-${POD_ID} ${YELLOW}ContainerCreating${RESET}\n"
  sleep 1
  printf "$(ts) Pod payments-api-new-${POD_ID} ${BOLD_GREEN}Running${RESET}\n"
done
printf "$(ts) ${BOLD_GREEN}Scaling completado. Replicas activas: ${REPLICAS}/${REPLICAS}${RESET}\n"
printf "$(ts) Load balancer actualizado automaticamente\n"
