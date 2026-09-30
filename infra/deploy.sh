#!/bin/bash
echo "[$(date +%H:%M:%S)] Iniciando deployment a PRODUCCION..."
sleep 1
echo "[$(date +%H:%M:%S)] Conectando al cluster prod-k8s-bogota-01..."
sleep 1
echo "[$(date +%H:%M:%S)] Autenticando con credenciales de servicio..."
sleep 1
echo "[$(date +%H:%M:%S)] -> Aplicando manifests: infra/deployment.yaml"
sleep 2
echo "[$(date +%H:%M:%S)] -> Actualizando imagen: payments-api:latest"
sleep 1
echo "[$(date +%H:%M:%S)] -> Esperando rollout..."
sleep 2
echo "[$(date +%H:%M:%S)] Pod payments-api-7d9f8b-xk9m2 Running"
sleep 1
echo "[$(date +%H:%M:%S)] Deployment completado. Replicas activas: 1/1"
echo "[$(date +%H:%M:%S)] WARN Sin health check configurado - asumiendo healthy"
