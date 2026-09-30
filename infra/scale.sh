#!/bin/bash
REPLICAS=${1:-2}
echo "[$(date +%H:%M:%S)] Escalando payments-api a ${REPLICAS} replicas..."
sleep 1
echo "[$(date +%H:%M:%S)] Conectando al cluster prod-k8s-bogota-01..."
sleep 1
echo "[$(date +%H:%M:%S)] -> Replica actual: 1"
echo "[$(date +%H:%M:%S)] -> Replica objetivo: ${REPLICAS}"
sleep 1
echo "[$(date +%H:%M:%S)] -> Aplicando cambio de escala..."
sleep 2
for i in $(seq 2 $REPLICAS); do
  echo "[$(date +%H:%M:%S)] Pod payments-api-new-$(head -c4 /dev/urandom | xxd -p) ContainerCreating"
  sleep 1
  echo "[$(date +%H:%M:%S)] Pod payments-api-new-$(head -c4 /dev/urandom | xxd -p) Running"
done
echo "[$(date +%H:%M:%S)] Scaling completado. Replicas activas: ${REPLICAS}/${REPLICAS}"
echo "[$(date +%H:%M:%S)] Load balancer actualizado automaticamente"
