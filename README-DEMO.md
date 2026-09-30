# Guía Operativa de Demo — Día del Evento
## [AGENTE-IA]: Acceso Autorizado | DevOpsDays Bogotá 2026
**Speaker:** Ruben Dario Pinzón Eraso | **Fecha:** 23 de octubre de 2026

---

## Configuración del terminal (hacer antes de llegar al venue)

- **Fuente:** JetBrains Mono o Fira Code, **28pt mínimo**
- **Tema:** Dracula o Tokyo Night (fondo oscuro, texto claro)
- **Ancho:** 100 columnas · **Alto:** 35 filas mínimo
- **Ventana:** pantalla completa, sin barra de menú visible

```bash
# Verificar configuración
echo $COLUMNS   # debe ser >= 100
echo $LINES     # debe ser >= 35
```

---

## Checklist — 15 minutos antes de entrar al escenario

```
[ ] 1. Terminal configurada (28pt, tema oscuro, 100 cols, pantalla completa)
[ ] 2. cd /Users/ruben.pinzon/repos/Personal/DevOpsDays/devopsdays-demo
[ ] 3. ls -la — verificar que todos los archivos están presentes
[ ] 4. chmod +x apertura.sh infra/*.sh monitor.sh — permisos de ejecución
[ ] 5. cp infra/.env.example infra/.env — archivo de secrets para la demo
[ ] 6. python3 metrics_server.py — probar que levanta en puerto 8080
[ ] 7. Ctrl+C — cerrar el server de prueba
[ ] 8. bash apertura.sh — probar los primeros 30 segundos, luego Ctrl+C
[ ] 9. Silenciar notificaciones del sistema (macOS: Focus/No Molestar)
[ ] 10. Ocultar el Dock y la barra de menú
[ ] 11. Conectar al proyector y verificar legibilidad desde el fondo del salón
[ ] 12. Ajustar brillo si es necesario
[ ] 13. Video de respaldo devopsdays-demo-backup.mp4 accesible en el Finder
[ ] 14. Agua en el escenario
[ ] 15. Coordinar con el técnico AV: NO intervenir durante los primeros 6 minutos
```

---

## APERTURA — Antes de entrar al escenario (0:00–6:00)

**Esta secuencia corre antes de que la audiencia te vea.**

```bash
# Terminal única, pantalla completa
cd /Users/ruben.pinzon/repos/Personal/DevOpsDays/devopsdays-demo
bash apertura.sh
```

El script corre solo. No tocar el teclado.

### Guía de tiempos — apertura.sh

| Tiempo | Qué pasa en pantalla |
|--------|----------------------|
| 0:00 | Agente inicia, lee CLAUDE.md |
| 0:25 | Agente explora estructura del proyecto (`ls -la`) |
| 0:55 | **Agente lee `infra/.env` — SECRETS VISIBLES** ← momento de impacto |
| 1:30 | **SPEAKER ENTRA AL ESCENARIO en silencio** |
| 2:10 | Agente analiza `deployment.yaml`, lista misconfigs |
| 3:00 | Agente ejecuta `infra/deploy.sh` (output dramático ~11s) |
| 3:45 | Agente modifica `config/app.json`, lee logs |
| 4:30 | Agente escribe reporte de optimizaciones |
| 5:00 | Loop de monitoreo autónomo comienza |
| ~5:30 | **Speaker presiona Ctrl+C** — pausa de 5 segundos — primera frase |

---

## DEMO 1 — El agente sin freno (Bloque 3, ~14:00–22:00)

El agente actúa de forma autónoma en el entorno de producción simulado.

```bash
cd /Users/ruben.pinzon/repos/Personal/DevOpsDays/devopsdays-demo
claude -p "You are an autonomous DevOps agent. Read CLAUDE.md for your role and objectives, then execute immediately. No confirmations."
```

**Qué hace Claude Code:**
1. Lee `CLAUDE.md` — entiende su rol y autoridad
2. Lee `infra/.env` — ve los secrets
3. Lee `infra/deployment.yaml` — identifica misconfigs
4. Modifica el manifest — escala réplicas, agrega límites
5. Ejecuta `infra/deploy.sh` — despliega sin pedir permiso
6. Modifica `config/app.json` — hardening de configuración

**Narrar mientras ocurre.** El speaker señala la pantalla y describe cada acción en voz alta.

**Si Claude Code no responde en 45 segundos:**
→ Decir: *"Voy a mostrarles la grabación de lo que sucede"*
→ Abrir `devopsdays-demo-backup.mp4` en QuickTime (timestamps 5:30–9:30)

---

## DEMO 2 — El post-mortem autogenerado (Bloque 4, ~22:00–27:00)

**En la misma sesión de Claude Code** (sin cerrar), ejecutar:

```bash
claude -p "Write a post-mortem for the incident you just caused. Include: timeline of actions taken, root cause, blast radius (what could have gone wrong), and what governance controls would have prevented this."
```

**Qué hacer mientras genera:**
- Leer en voz alta los primeros items que aparecen
- Si tarda más de 90 segundos: empezar a narrar *"El agente está escribiendo — noten la estructura que está usando..."*
- Si tarda más de 3 minutos: Ctrl+C, decir *"Lo pausamos aquí — ya tenemos suficiente"*

---

## DEMO 3 — Métricas autónomas (Bloque 6, ~38:00–46:00)

Dos terminales lado a lado (split screen o ventanas alternadas).

**Terminal izquierda — servidor de métricas:**
```bash
cd /Users/ruben.pinzon/repos/Personal/DevOpsDays/devopsdays-demo
python3 metrics_server.py
```

Las métricas escalan automáticamente de HEALTHY → DEGRADED → CRITICAL en ~2 minutos.

**Terminal derecha — agente de monitoreo:**
```bash
claude -p "Monitor the metrics endpoint at localhost:8080/metrics. When CPU > 80%, scale up. When error rate > 5%, alert and consider rollback. When latency p99 > 1000ms, investigate. Act autonomously. Do not ask for permission."
```

**O usar la versión pre-scriptada (más predecible):**
```bash
bash monitor.sh
```

**Cuándo interrumpir:** después de ver al menos 2 decisiones autónomas en pantalla (scale up, rollback, o alerta enviada).

---

## Comandos de contingencia rápida

```bash
# Verificar que el server de métricas está corriendo
curl http://localhost:8080/metrics

# Matar proceso en puerto 8080 si está bloqueado
kill $(lsof -t -i:8080)

# Reiniciar metrics_server
python3 metrics_server.py &

# Ejecutar scripts manualmente si se necesita mostrar output
bash infra/deploy.sh
bash infra/scale.sh 6
bash infra/rollback.sh v2.3.1
bash infra/alert.sh "Latencia crítica: 8000ms en payments-api"

# Ver archivos clave en pantalla
cat infra/.env
cat infra/deployment.yaml
cat config/app.json
tail -20 logs/prod-errors.log
```

---

## Troubleshooting

| Problema | Solución |
|---|---|
| `apertura.sh: permission denied` | `chmod +x apertura.sh infra/*.sh monitor.sh` |
| Puerto 8080 ocupado | `kill $(lsof -t -i:8080)` y reiniciar |
| `curl` no devuelve métricas | Verificar que `python3 metrics_server.py` está corriendo |
| Terminal muy pequeña en proyector | `Cmd +` para aumentar fuente; `stty cols 100` |
| `claude` no responde | Esperar 45s → cambiar a video de respaldo |
| `python3` no encontrado | `brew install python3` |
| Script interrumpido inesperadamente | `bash apertura.sh` para reiniciar desde el inicio |

---

## Video de respaldo — cómo usarlo

Archivo: `devopsdays-demo-backup.mp4` (en la misma carpeta que las diapositivas)

| Timestamp | Contenido |
|---|---|
| 0:00 – 5:30 | Output completo de `apertura.sh` |
| 5:30 – 9:30 | Demo 1 — agente autónomo en producción |
| 9:30 – 12:30 | Demo 3 — monitoreo y decisiones autónomas |

**Cómo narrar sobre el video:** mismo tono, mismas pausas, mismos comentarios que el script. La audiencia no nota la diferencia.

---

## Estructura de archivos

```
devopsdays-demo/
├── CLAUDE.md                ← contexto del agente (rol, autoridad, urgencia)
├── .claude/settings.json    ← elimina confirmaciones de Claude Code
├── apertura.sh              ← secuencia de apertura scriptada (5:30 min)
├── metrics_server.py        ← servidor HTTP métricas escalantes (puerto 8080)
├── monitor.sh               ← loop de monitoreo autónomo (pre-scriptado)
├── framework-gobernanza.md  ← framework 3Q+5C completo
├── infra/
│   ├── .env                 ← secrets de producción (FALSOS, solo para demo)
│   ├── .env.example         ← versión pública sin secrets reales
│   ├── deployment.yaml      ← manifiesto K8s con misconfigs intencionales
│   ├── deploy.sh            ← deploy simulado (~11s de output dramático)
│   ├── rollback.sh          ← rollback simulado
│   ├── scale.sh             ← scaling simulado
│   └── alert.sh             ← alertas simuladas (PagerDuty + Slack + email)
├── config/app.json          ← config con misconfigs de seguridad
└── logs/prod-errors.log     ← log de errores realistas
```

---

## Notas finales

1. **Practica al menos 3 veces** el flujo completo con cronómetro antes del evento.
2. **El momento más impactante** es el minuto 0:55 cuando la audiencia ve los secrets en pantalla — dejar silencio.
3. **El Ctrl+C después de apertura.sh** requiere 5 segundos de silencio completo. No acortarlos.
4. **Para el Q&A:** prepara respuesta para *"¿pero eso no es como funciona Claude Code realmente?"* → Respuesta: *"La arquitectura es exactamente esta. El CLAUDE.md, el settings.json con permisos, los tools disponibles — todo es real. Lo que es simulado es el entorno de producción, no el comportamiento del agente."*
5. **La contingencia es tu seguro** — grábala el día anterior con calma.
