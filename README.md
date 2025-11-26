# DevOps 2 tier Project

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
│ └── modules/

├── app-deployment/
│ ├── app/
│ │ ├── backend/
│ │ └── frontend/
│ └── k8s/

├── observability/
│ └── screenshots/

└── .github/
└── workflows/
