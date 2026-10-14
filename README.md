# DevOps Challenge 1: From Manual to Automated Deployment

## 1. Project Overview
Project implements a complete deployment cycle for a Python Flask application on an Ubuntu environment. The progression covers:
Manual Deployment -> Gir Version Control -> systemd Process Management -> Nginx Reverse Proxy -> Bash Automation Script ('deploy.sh') with Health Check validation

--

## 2.Architecture
The incoming requests flow from the client browser to Nginx listening on port 80, which acts as a reverse proxy forwarding requests to the internal Flask application running on port 5000 managed by systemd:

[User/Browser]
|
HTTP:80
v
[Nginx Reverse Proxy]
|
127.0.0.1:5000
v
[Flask App (systemd: devops-app)]


Architecture Diagram: 'docs/architecture.png'

---

## 3. Manual Installation
Initial prerequisites and setup sequence:
'''bash
sudo apt update
sudo apt install -y python3 python3-venv python3-pip nginx git

cd /opt/devops-app
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

## Team Members

- Group DevOps Challenge 1:
	- Nguyen Thanh An
	- Tran Vinh Dai
	- Dao Tuan Bao

