from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def index():
    return jsonify(message="Hello from private EC2 behind ALB!")


@app.route("/health")
def health():
    return jsonify(status="ok"), 200
