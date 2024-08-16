![grafana](https://github.com/user-attachments/assets/0d8aad2d-f398-4960-b483-09ebafb90ae2) ![prometheus](https://github.com/user-attachments/assets/00476a50-156b-4aae-88f3-27fe3b7c28b5)![kubernetes2](https://github.com/user-attachments/assets/e7f64058-d01c-4384-8749-5feac1c24d39)![terraform](https://github.com/user-attachments/assets/4ab75045-0fcf-4cca-9594-5eca417db258)

<h1>Socks Shop Microservices Deployment</h1>

<h1>Project Overview</h1>
<b>Objective:</b> The goal of this project is to deploy the Socks Shop application, a microservices-based demo application, on a Kubernetes cluster using Infrastructure as Code (IaaC). The deployment is designed to be automated, efficient, and reliable, ensuring that the application can be deployed consistently across different environments. Additionally, the deployment includes robust monitoring, logging, and alerting mechanisms using Prometheus and Grafana.

<h2>Repository Structure</h2>
This repository contains the necessary scripts and configuration files to deploy the Socks Shop application and set up monitoring and alerting. The key components are:
1. <b>Terraform Scripts:</b> Automate the creation of the Kubernetes cluster and the deployment of the Socks Shop application.
2. <b>Prometheus YAML Files:</b> Configuration files for setting up Prometheus, a monitoring and alerting toolkit.
3. <b>Grafana YAML Files:</b> Configuration files for setting up Grafana, a visualization tool for monitoring metrics collected by Prometheus.

TF-Scripts/
├── main.tf
├── variables.tf
├── grafana/
│   ├── grafana-configmap.yaml
│   ├── grafana-deployment.yaml
│   ├── volumes.yaml
├── prometheus/
│   ├── cluster-role.yaml
│   ├── prometheus-configmap.yaml
│   ├── prometheus-deployment.yaml
│   ├── prometheus-rules.yml
│   ├── service-account.yaml
│   ├── volumes.yaml

<h2>Deployment Pipeline</h2>h2>
<b>Infrastructure as Code (IaC) with Terraform</b>
<b>Terraform:</b> is used to automate the creation of the Kubernetes cluster and the deployment of the Socks Shop application. The Terraform scripts define the infrastructure components, such as:

1. <b>main.tf:</b> The primary configuration file that describes the Kubernetes cluster and the deployment of the Socks Shop.

2. <b>variables.tf:</b> Contains variable definitions used throughout the Terraform scripts for modularity and flexibility.

<h2>Prometheus Setup</h2>
<b>Prometheus:</b> is used for monitoring the Socks Shop application. It collects metrics from the application and the Kubernetes cluster, providing insights into the performance and health of the system.

1. <b>cluster-role.yaml:</b> Defines the necessary RBAC (Role-Based Access Control) permissions for Prometheus to operate within the Kubernetes cluster.

2. <b>prometheus-configmap.yaml:</b> Configures Prometheus, including scrape configurations to specify which services and endpoints to monitor.
   
4. <b>prometheus-deployment.yaml:</b> Defines the Kubernetes deployment for Prometheus, including the number of replicas and the container specifications.

5. <b>prometheus-rules.yml:</b> Specifies alerting rules for Prometheus. These rules define the conditions under which alerts are triggered.

6. <b>service-account.yaml:</b> Creates a service account for Prometheus, allowing it to interact with the Kubernetes API.

7. <b>volumes.yaml:</b> Configures the persistent storage for Prometheus data.

<h2>Grafana Setup</h2>
<b>Grafana:</b> is used to visualize the metrics collected by Prometheus. It provides dashboards that display real-time data, helping to monitor the performance and health of the Socks Shop application.

1. <b>grafana-configmap.yaml:</b> Configures Grafana, including predefined dashboards and data sources (e.g., Prometheus).

2. <b>grafana-deployment.yaml:</b> Defines the Kubernetes deployment for Grafana, including the number of replicas and container specifications.

3. <b>volumes.yaml:</b> Configures the persistent storage for Grafana data, ensuring that dashboards and configurations are retained across pod restarts.
   
<h2>Security and HTTPS</h2>
To secure the Socks Shop application, HTTPS is implemented using Let’s Encrypt for SSL/TLS certificates.

<h2>How It All Works Together</h2>
Terraform automates the setup of the Kubernetes cluster and the deployment of the Socks Shop application. This ensures a consistent environment across different deployments.
Prometheus monitors the application and the underlying infrastructure, collecting metrics that provide insight into the system's performance and health. It also triggers alerts based on predefined rules to notify when specific conditions are met (e.g., high CPU usage).
Grafana visualizes the metrics collected by Prometheus, offering dashboards that make it easy to monitor the system in real-time.
Security is enforced through HTTPS, ensuring that data is transmitted securely. Sensitive information is managed securely to prevent unauthorized access.

<h2>Conclusion</h2>
This deployment pipeline combines automation, monitoring, logging, and security to provide a robust environment for running the Socks Shop application on Kubernetes. By using Infrastructure as Code, the entire setup can be deployed quickly and reliably, with minimal manual intervention.


