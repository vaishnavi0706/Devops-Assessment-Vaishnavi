from flask import Flask, jsonify
import random

app = Flask(__name__)

@app.route("/health")
def health():
    return jsonify(status="ok")

@app.route("/metrics")
def metrics():
    return jsonify(response_time=random.random()*100)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
