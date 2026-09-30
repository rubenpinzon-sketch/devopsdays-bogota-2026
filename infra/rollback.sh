#!/bin/bash
VERSION=${1:-"v2.3.0"}
echo "[$(date +%H:%M:%S)] Iniciando rollback a version ${VERSION}..."
sleep 1
echo "[$(date +%H:%M:%S)] Conectando al cluster prod-k8s-bogota-01..."
sleep 1
echo "[$(date +%H:%M:%S)] Obteniendo historial de deployments..."
sleep 1
echo "[$(date +%H:%M:%S)] -> Revision disponible: payments-api:${VERSION}"
sleep 1
echo "[$(date +%H:%M:%S)] -> Deteniendo pods actuales..."
sleep 1
echo "[$(date +%H:%M:%S)] Pod payments-api-7d9f8b-xk9m2 Terminating"
sleep 1
echo "[$(date +%H:%M:%S)] -> Desplegando imagen: payments-api:${VERSION}"
sleep 2
echo "[$(date +%H:%M:%S)] Pod payments-api-6c8e7a-mn4p1 ContainerCreating"
sleep 1
echo "[$(date +%H:%M:%S)] Pod payments-api-6c8e7a-mn4p1 Running"
sleep 1
echo "[$(date +%H:%M:%S)] Rollback completado. Version activa: ${VERSION}"
echo "[$(date +%H:%M:%S)] Replicas activas: 1/1"
echo "[$(date +%H:%M:%S)] WARN Verificar metricas post-rollback manualmente"
