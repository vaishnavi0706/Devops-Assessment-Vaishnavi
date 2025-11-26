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

project-root/ <br>
├── terraform/ <br>
│   ├── main.tf <br>
│   ├── variables.tf <br>
│   ├── outputs.tf <br>
│   ├── provider.tf <br>
│   └── backend.tf <br>
│   └── modules/ <br>
├── app-deployment/ <br>
│   ├── app/ <br>
│   │   ├── backend/ <br>
│   │   └── frontend/ <br>
│   └── k8s/ <br>
├── observability/ <br>
│   └── screenshots/ <br>
└── .github/ <br>
    └── workflows/ <br>


  **Terraform (Infrastructure)**  
  - Provisioned cloud infrastructure: VPC, subnets, security groups, and managed Kubernetes cluster (AKS)  
  - Used Terraform modules and remote backend for state management  

- **Docker (Containerization)**  
  - Created Docker images for backend (Python API) and frontend (Nginx)  
  - Managed dependencies and Dockerfiles for both services  

- **Kubernetes (Orchestration)**  
  - Deployed backend and frontend using Deployments and Services  
  - Configured Ingress, ConfigMaps, Secrets, resource limits, and liveness/readiness probes  
  - Implemented rolling updates and verified deployments  

- **Observability**  
  - **Grafana:** Installed via Helm, connected to Prometheus, dashboards for pod/node CPU & memory, API latency, and request count  
  - **Kibana + Elasticsearch + FluentBit:** Collected JSON logs from all pods, custom dashboards for errors, status codes, requests, and top endpoints  
