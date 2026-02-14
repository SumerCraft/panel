
# SumerCraft

SumerCraft is a Minecraft server network that uses a hybrid architecture to combine the best of professional management (Pterodactyl Panel) and critical infrastructure (Docker Compose).

## General Architecture

- **Pterodactyl Panel + Wings**: Manages game servers (Paper, Fabric, Lobby, Plots, etc.) through a friendly web interface and multi-user support.
- **Docker Compose**: Runs critical services such as the Velocity Proxy (entry point for Java and Bedrock players), centralized monitoring (Grafana, Loki, Alloy), and other infrastructure services.
- All services share a Docker network (`mcnet`) for efficient integration and communication.

## Advantages of the hybrid approach

- **Stability and control**: Velocity and monitoring run outside the Panel, ensuring uptime and full configuration control.
- **Easy management and community support**: Game servers are managed from Pterodactyl, which is widely used and documented.
- **Scalability and modularity**: It's easy to add new servers or services as the network grows.
- **Centralized monitoring**: All logs and metrics are aggregated in Grafana/Loki for easy analysis and troubleshooting.

## High-level diagram

Players (Java/Bedrock) → Velocity Proxy (Docker Compose) → MC Servers (Pterodactyl Panel) → Monitoring (Grafana/Loki)

## Main components

- Velocity Proxy (Docker Compose)
- Grafana, Loki, Alloy (Docker Compose)
- Paper/Fabric/Plots Servers (Pterodactyl)
- Pterodactyl Panel + Wings (web management and daemon)

## Recommended requirements

- Docker and Docker Compose
- Pterodactyl Panel and Wings
- 4+ CPU cores, 16+ GB RAM, 100+ GB SSD

## Current server hardware (single host)

- **CPU**: Intel Xeon-D 1520 (4c/8t, 2.2/2.6 GHz)
- **RAM**: 32 GB ECC 2133 MHz
- **Storage**: 2×480 GB SSD SATA (software RAID)

---

This README summarizes the architecture and purpose of the project to make it easier to understand and onboard new sessions or collaborators.
