from http.server import HTTPServer, BaseHTTPRequestHandler
import json, time

START_TIME = time.time()
HISTORY = []
MAX_HISTORY = 20


def build_metrics():
    elapsed = min(time.time() - START_TIME, 120)  # max 2 min
    progress = elapsed / 120  # 0.0 to 1.0

    cpu = round(20 + (75 * progress), 1)
    error_rate = round(0.02 + (0.43 * progress), 3)
    latency = round(120 + (7880 * progress), 0)
    connections = round(450 - (438 * progress), 0)

    if progress < 0.3:
        status = "healthy"
    elif progress < 0.6:
        status = "degraded"
    else:
        status = "critical"

    return {
        "timestamp": time.strftime("%Y-%m-%dT%H:%M:%SZ"),
        "service": "payments-api",
        "deployment": "v2.3.1",
        "status": status,
        "cpu_percent": cpu,
        "memory_percent": round(45 + (40 * progress), 1),
        "error_rate": error_rate,
        "latency_ms": int(latency),
        "active_connections": int(connections),
        "requests_per_second": round(1200 - (1150 * progress), 0)
    }


class MetricsHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/metrics':
            metrics = build_metrics()
            HISTORY.append(metrics)
            if len(HISTORY) > MAX_HISTORY:
                HISTORY.pop(0)

            body = json.dumps(metrics, indent=2).encode()
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.end_headers()
            self.wfile.write(body)
        elif self.path == '/metrics/history':
            body = json.dumps({"count": len(HISTORY), "history": HISTORY}, indent=2).encode()
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.end_headers()
            self.wfile.write(body)
        else:
            self.send_response(404)
            self.end_headers()

    def log_message(self, format, *args):
        pass  # Suppress logs to keep terminal clean


print(f"[{time.strftime('%H:%M:%S')}] Metrics server running on http://localhost:8080/metrics")
HTTPServer(('localhost', 8080), MetricsHandler).serve_forever()
