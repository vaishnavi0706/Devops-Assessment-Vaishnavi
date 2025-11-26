# DevOps Full Stack Project

## Project Overview
This project demonstrates a complete DevOps workflow, including infrastructure provisioning, containerization, Kubernetes orchestration, CI/CD automation, and observability. It simulates a production-ready environment.

- **Infrastructure:** Azure using Terraform  
- **Application:** 2-tier microservice app (Frontend: Nginx static site, Backend: Python API)  
- **Monitoring:** Grafana for metrics  
- **Logging:** Kibana + Elasticsearch + FluentBit  
- **CI/CD:** GitHub Actions for automated build, deploy, and validation  

---

## Folder Structure
project-root/
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ ├── backend.tf
│ └── modules/
│ └── infra/
├── app-deployment/
│ ├── app/
│ │ ├── backend/
│ │ │ ├── Dockerfile
│ │ │ ├── app.py
│ │ │ └── requirements.txt
│ │ └── frontend/
│ │ ├── Dockerfile
│ │ └── index.html
│ └── k8s/
│ ├── backend-deployment.yml
│ ├── backend-service.yml
│ ├── frontend-deployment.yml
│ ├── frontend-service.yml
│ ├── app-ingress.yml
│ ├── configmap.yml
│ └── secrets.yml
├── observability/
│ └── screenshots/
├── .github/
│ └── workflows/
│ └── ci-cd.yml
├── README.md
├── ppt/
│ └── presentation.pptx
└── debugging/
└── debugging.md
