# Monitoring System

This project provides a containerized monitoring stack using Prometheus, Grafana, Alertmanager, Loki, and exporters for system and application metrics/logs.

## Features

- **Prometheus** for metrics collection and alerting
- **Grafana** for dashboards and visualization
- **Alertmanager** for notifications (e.g., Telegram)
- **Loki** and **Promtail** for log aggregation
- **Node Exporter**, **cAdvisor**, **nginxlog-exporter** for system and application metrics

## Getting Started

### 1. Clone the repository

```sh
git clone https://github.com/teenxsky/monitoring-system.git
cd monitoring-system
```

### 2. Configure environment variables

- Copy `.env` to `.env.local`:
  ```sh
  cp .env .env.local
  ```
- Edit `.env.local` to set your custom values (ports, credentials, Telegram tokens, etc).

> **Note:**
> The `.env` file contains default values.
> Always use `.env.local` for your local or production overrides.

### 3. Build and start the stack

```sh
make build
make up
```

Or, to start and view logs:

```sh
make up-logs
```

### 4. Access the services

- **Grafana:** http://localhost:9999

## Useful Makefile Commands

- `make build` — Build Docker images
- `make up` — Start services in the background
- `make up-logs` — Start services and show logs
- `make restart` — Restart all services
- `make clean` — Stop and remove containers and images
- `make clean-volumes` — Remove containers, images, and volumes

---

For further configuration, see the `conf/` directory for Prometheus, Grafana, and Alertmanager settings.
