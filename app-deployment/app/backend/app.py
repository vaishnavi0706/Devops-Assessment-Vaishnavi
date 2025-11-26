from flask import Flask, jsonify
from prometheus_client import Counter, Histogram, make_wsgi_app
from werkzeug.middleware.dispatcher import DispatcherMiddleware
import time

app = Flask(__name__)

# Prometheus metrics
REQUESTS = Counter('http_requests_total', 'Total HTTP requests', ['endpoint', 'method'])
LATENCY = Histogram('http_request_duration_seconds', 'Request latency in seconds', ['endpoint'])

# Health endpoint
@app.route('/api/health')
def health():
    REQUESTS.labels(endpoint='/api/health', method='GET').inc()
    with LATENCY.labels(endpoint='/api/health').time():
        return jsonify({"status": "ok"})

@app.route('/health')
def health_root():
    return jsonify({"status": "ok"})

# Example API endpoint
@app.route('/api/endpoint1')
def endpoint1():
    REQUESTS.labels(endpoint='/api/endpoint1', method='GET').inc()
    with LATENCY.labels(endpoint='/api/endpoint1').time():
        time.sleep(0.01)
        return jsonify({"data": "response from endpoint1"})

# Expose metrics at /metrics
app.wsgi_app = DispatcherMiddleware(app.wsgi_app, {
    '/metrics': make_wsgi_app()
})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
