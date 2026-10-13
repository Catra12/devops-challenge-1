#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "==== Bat dau trien khai DevOps ===="
cd "$APP_DIR"

echo "[1] Cap nhat ma nguon tu Git..."
if [ -d ".git" ]; then
	git pull || echo "Chua cau hinh remote, bo qua git pull."
fi

echo "[2] Cai dat thu vien..."
source venv/bin/activate
pip install -r requirements.txt

echo "[3] Khoi dong lai ung dung (systemd)..."
sudo systemctl restart devops-app

echo "[4] Kiem tra trang thai service..."
sudo systemctl is-active --quiet devops-app

echo "[5] Chay Health check..."
#Doi service khoi dong hoan toan
sleep 2
if curl --fail --silent http://localhost/health | grep -q '"status":\s*"ok"'; then
	echo "=> Ung dung dang khoe manh (Healthy)."
	echo "=> Trien khai thanh cong (Deployment successful)."
else
	echo "=> Health check that bai." >&2
	exit 1
fi

