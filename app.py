import os
from flask import Flask, jsonify

app = Flask(__name__)

APP_NAME = os.getenv("APP_NAME", "DevOps Challenge 1")
APP_ENV = os.getenv("APP_ENV", "development")
APP_PORT = int(os.getenv("APP_PORT", 5000))

@app.route("/")
def home():
	return f"{APP_NAME} - Environment: {APP_ENV}"

@app.route("/health")
def health():
	return jsonify({"status": "ok"}), 200

if __name__ == "__main__":
	app.run(host="127.0.0.1", port=APP_PORT)

