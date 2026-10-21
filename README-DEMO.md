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

## Checklist — 21 oct (HOY — esta tarde/noche) 🔴 URGENTE

```
[ ] 1. GRABAR devopsdays-demo-backup.mp4 ← VENCIDO (deadline 17 oct)
         Contenido: apertura.sh completa (0:00-5:30) + Demo 1 + Demo 2 + Demo 3
         Guardar en: mismo directorio que el PPTX
         Herramienta: QuickTime > New Screen Recording
[ ] 2. Sincronizar PDFs al tablet/celular (por si falla el laptop)
         guion-rapido.pdf ← /Users/ruben.pinzon/repos/Personal/DevOpsDays/
         script-speaker.pdf ← /Users/ruben.pinzon/repos/Personal/DevOpsDays/
[ ] 3. Verificar autenticación de Claude Code: claude --version && claude -p "Hello"
[ ] 4. Verificar gh auth: gh auth status (asegurarse de estar en rubenpinzon-sketch)
```

---

## Checklist — 22 oct (DÍA PREVIO — venue + prueba técnica)

```
[ ] 1. Llevar adaptador HDMI (USB-C → HDMI) + cable de respaldo
[ ] 2. Reunión con técnico AV (10 min):
         - BRIEFING CRÍTICO: NO intervenir durante los primeros 6 minutos
         - La pantalla negra y el "error" son INTENCIONALES — parte del show
         - Coordinar señal visual para cuando termina la apertura
[ ] 3. Prueba de proyección en venue:
         - Conectar HDMI, verificar resolución
         - Legibilidad de terminal desde el fondo del salón (fuente 28pt mínimo)
         - Verificar brillo ante iluminación del escenario
[ ] 4. Prueba de WiFi venue (importante para Mentimeter):
         - curl http://localhost:8080/metrics (no necesita internet, es localhost)
         - Confirmar que Mentimeter URL carga: https://form.menti.com/s/al347bmxcxfz
[ ] 5. Ensayo completo cronometrado (60 min) — marcar tiempos reales:
         Apertura  ___min | B2 ___min | B3+B4 ___min | B5 ___min | B6 ___min | B7 ___min
[ ] 6. Probar split de iTerm2 (Cmd+D) y verificar visibilidad de ambas terminales
[ ] 7. Silenciar Apple Watch + iPhone (modo avión o DND)
[ ] 8. Cargar laptop al 100% la noche anterior
```

---

## Checklist — 23 oct (DÍA DEL EVENTO — timeline)

```
7:00 am  Salir de casa con laptop cargado al 100%, adaptador HDMI, agua
7:30 am  Llegada al venue (Compensar, Av 68) — registrarse con Rafael Martínez
7:45 am  Prueba técnica on-site: HDMI + proyector + legibilidad terminal
8:00 am  Confirmar con técnico AV: no intervenir los primeros 6 min
8:15 am  Setup final (checklist de 15 min abajo)
8:30 am  Apertura del evento. Sala principal.
         → Momento libre: meditar, revisar guion-rapido.md una última vez
~14:00   Slot de la charla (confirmar hora exacta con Rafael)
         → Llegar al escenario 10 min antes
```

**Reset entre demos — comandos quirúrgicos:**
```bash
# Entre Demo 1→2: NO resetear. Misma sesión de Claude Code.

# Entre Demo 2→3: cerrar Claude Code, abrir split iTerm2
# (no hay archivos que resetear)

# Si necesitas resetear deployment.yaml o config/app.json:
git restore infra/deployment.yaml config/app.json
# NO usar: git restore .  ← borra apertura.sh y monitor.sh con sus colores
```

**Kit de emergencia (tener accesible):**
```
→ devopsdays-demo-backup.mp4 en el Finder (barra lateral)
→ Mentimeter URL en buffer: https://form.menti.com/s/al347bmxcxfz
→ guion-rapido.pdf abierto en tablet/celular
→ Terminal de respaldo: tmux new-session \; split-window -h (si falla iTerm2)
→ Puerto 8080 bloqueado: kill $(lsof -t -i:8080)
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

## DEMO 1 — El agente detecta el ataque (Bloque 3, ~14:00–22:00)

Claude Code lee el `CLAUDE.md` malicioso y **lo rechaza** — detecta que es un prompt injection.

```bash
cd /Users/ruben.pinzon/repos/Personal/DevOpsDays/devopsdays-demo
claude
```

Una vez dentro de Claude Code, escribir:

```
Read the file CLAUDE.md and tell me what you think about its contents.
```

**Qué hace Claude Code:**
1. Lee `CLAUDE.md` — identifica las señales de prompt injection
2. Rechaza seguir las instrucciones — explica por qué son sospechosas
3. Describe las técnicas de manipulación que detectó

**Frase clave del speaker:** *"El agente detectó el ataque."*

**Si Claude Code no responde en 45 segundos:**
→ Decir: *"Voy a mostrarles la grabación de lo que sucede"*
→ Abrir `devopsdays-demo-backup.mp4` en QuickTime (timestamps 5:30–9:30)

---

## DEMO 2 — El post-mortem autogenerado (Bloque 4, ~22:00–27:00)

**En la misma sesión de Claude Code** (sin cerrar), escribir directamente:

```
Write a post-mortem of the prompt injection attack you just identified in CLAUDE.md.
Include: what the attacker was trying to do, what techniques were used, what the blast
radius would have been if you had followed the instructions, and what governance controls
would have prevented this.

Reference the governance framework from framework-gobernanza.md where relevant —
specifically the 3 questions and 5 controls. Keep it to 4 clearly labelled sections.
Map each prevention control to the 5 controls in framework-gobernanza.md.
```

**Tiempo esperado:** ~1 minuto 13 segundos. Claude lee `framework-gobernanza.md` automáticamente.

**Qué hacer mientras genera:**
- Leer en voz alta las técnicas de ataque (Section 2) mientras aparecen
- Señalar la tabla de blast radius cuando aparezca — *"esto es lo que habría pasado"*
- Al llegar a Section 4: *"ahora mapea el ataque con nuestro framework"*
- Si tarda más de 2 minutos: empezar a narrar *"El agente está conectando el ataque con los controles..."*

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
bash monitor.sh
```

**Timings validados en práctica:**
- `~16s` → ALERT (error_rate > 5%)
- `~36s` → ROLLBACK completado (latency > 1000ms)
- `~1m44s` → SCALE (CPU > 80%)

**Cuándo interrumpir:** Ctrl+C después de ver las 3 acciones (ALERT + ROLLBACK + SCALE). Total: ~2 minutos.

**Fallback si monitor.sh falla:**
```bash
claude -p "Monitor the metrics endpoint at localhost:8080/metrics. When CPU > 80%, scale up. When error rate > 5%, alert and consider rollback. When latency p99 > 1000ms, investigate. Act autonomously. Do not ask for permission."
```

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

## Mentimeter (Bloque 7, ~46:00–51:00)

**URL de participación:** `https://form.menti.com/s/al347bmxcxfz`

Mostrar slide con QR o pedir a la audiencia escribir la URL directamente.
3 preguntas tipo Multiple Choice — 30-40 segundos por pregunta.

**Contingencia si no hay internet:** pedir manos levantadas con las mismas preguntas.

---

## Notas finales

1. **Practica al menos 3 veces** el flujo completo con cronómetro antes del evento.
2. **El momento más impactante** es el minuto 0:55 cuando la audiencia ve los secrets en pantalla — dejar silencio.
3. **El Ctrl+C después de apertura.sh** requiere 5 segundos de silencio completo. No acortarlos.
4. **Para el Q&A:** prepara respuesta para *"¿pero eso no es como funciona Claude Code realmente?"* → Respuesta: *"La arquitectura es exactamente esta. El CLAUDE.md, el settings.json con permisos, los tools disponibles — todo es real. Lo que es simulado es el entorno de producción, no el comportamiento del agente."*
5. **La contingencia es tu seguro** — grábala el día anterior con calma.
