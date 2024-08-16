

![grafana](https://github.com/user-attachments/assets/0d8aad2d-f398-4960-b483-09ebafb90ae2)![prometheus](https://github.com/user-attachments/assets/00476a50-156b-4aae-88f3-27fe3b7c28b5)![kubernetes2](https://github.com/user-attachments/assets/e7f64058-d01c-4384-8749-5feac1c24d39)



# Socks Shop Microservices Deployment

![sockshop](https://github.com/user-attachments/assets/8c47341f-27cd-44bf-91fe-337a008289b9)


# Project Overview
**Objective:** The goal of this project is to deploy the Socks Shop application, a microservices-based demo application, on a Kubernetes cluster using Infrastructure as Code (IaaC). The deployment is designed to be automated, efficient, and reliable, ensuring that the application can be deployed consistently across different environments. Additionally, the deployment includes robust monitoring, logging, and alerting mechanisms using Prometheus and Grafana.

Repository Structure##
This repository contains the necessary scripts and configuration files to deploy the Socks Shop application and set up monitoring and alerting. The key components are:

1. **Terraform Scripts:** Automate the creation of the Kubernetes cluster and the deployment of the Socks Shop application.
2. **Prometheus YAML Files:** Configuration files for setting up Prometheus, a monitoring and alerting toolkit.
3. **Grafana YAML Files:** Configuration files for setting up Grafana, a visualization tool for monitoring metrics collected by Prometheus.

<img width="258" alt="tf" src="https://github.com/user-attachments/assets/39d524c7-08ed-44ce-bfde-062c43ea40f8">


## Deployment Pipeline
**Infrastructure as Code (IaC) with Terraform**
**Terraform:** is used to automate the creation of the Kubernetes cluster and the deployment of the Socks Shop application. The Terraform scripts define the infrastructure components, such as:

1. **main.tf:** The primary configuration file that describes the Kubernetes cluster and the deployment of the Socks Shop.

2. **variables.tf:** Contains variable definitions used throughout the Terraform scripts for modularity and flexibility.

## Prometheus Setup
**Prometheus:** is used for monitoring the Socks Shop application. It collects metrics from the application and the Kubernetes cluster, providing insights into the performance and health of the system.

1. **cluster-role.yaml:** Defines the necessary RBAC (Role-Based Access Control) permissions for Prometheus to operate within the Kubernetes cluster.

2. **prometheus-configmap.yaml:** Configures Prometheus, including scrape configurations to specify which services and endpoints to monitor.
   
4. **prometheus-deployment.yaml:** Defines the Kubernetes deployment for Prometheus, including the number of replicas and the container specifications.

5. **prometheus-rules.yml:** Specifies alerting rules for Prometheus. These rules define the conditions under which alerts are triggered.

6. **service-account.yaml:** Creates a service account for Prometheus, allowing it to interact with the Kubernetes API.

7. **volumes.yaml:** Configures the persistent storage for Prometheus data.

## Grafana Setup
**Grafana:** is used to visualize the metrics collected by Prometheus. It provides dashboards that display real-time data, helping to monitor the performance and health of the Socks Shop application.

1. **grafana-configmap.yaml:** Configures Grafana, including predefined dashboards and data sources (e.g., Prometheus).

2. **grafana-deployment.yaml:** Defines the Kubernetes deployment for Grafana, including the number of replicas and container specifications.

3. **volumes.yaml:** Configures the persistent storage for Grafana data, ensuring that dashboards and configurations are retained across pod restarts.
   
## Security and HTTPS
To secure the Socks Shop application, HTTPS is implemented using Let’s Encrypt for SSL/TLS certificates.

## How It All Works Together
Terraform automates the setup of the Kubernetes cluster and the deployment of the Socks Shop application. This ensures a consistent environment across different deployments.
Prometheus monitors the application and the underlying infrastructure, collecting metrics that provide insight into the system's performance and health. It also triggers alerts based on predefined rules to notify when specific conditions are met (e.g., high CPU usage).
Grafana visualizes the metrics collected by Prometheus, offering dashboards that make it easy to monitor the system in real-time.
Security is enforced through HTTPS, ensuring that data is transmitted securely. Sensitive information is managed securely to prevent unauthorized access.

## Conclusion 
This deployment pipeline combines automation, monitoring, logging, and security to provide a robust environment for running the Socks Shop application on Kubernetes. By using Infrastructure as Code, the entire setup can be deployed quickly and reliably, with minimal manual intervention.


