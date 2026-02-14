
# SumerCraft - Architecture Overview

## Objective
Establish a robust Minecraft network where Java and Bedrock players can connect, using a hybrid architecture for flexibility, stability, and ease of management.

## Hybrid Architecture

This project uses a **hybrid approach**:

- **Pterodactyl Panel + Wings**: Manages Minecraft game servers via a web interface with multi-user support and automated backups.
- **Docker Compose**: Runs critical infrastructure services (proxy) independently for maximum stability.

### Why this architecture?

- **Stability**: Proxy is always available, independent of the game panel.
- **Community support**: Game servers are managed with Pterodactyl, a widely adopted solution.
- **Scalability**: New servers or services can be added modularly.


## General Structure

```
Players (Java/Bedrock)
   ↓
Velocity Proxy (Docker Compose)
   ↓
Pterodactyl Game Servers (Lobby, Survival, Plots, etc.)
```


## Main Components

### Infrastructure (Docker Compose)
- **Velocity Proxy**: Main entry point and router for all players.
- **(Optional) ViaProxy**: For Bedrock legacy support if needed.

### Game Servers (Pterodactyl)
- Managed via web UI (Lobby, Survival, Plots, etc.)
- Multi-user, backup, and resource management features.


## Networking
All services share the Docker network `mcnet` for seamless communication between infrastructure and game servers.


## User Flow
1. Player connects (Java or Bedrock)
2. Velocity Proxy handles authentication and routing
3. Player enters the lobby or selected game server (managed by Pterodactyl)
4. Player activity and logs can be monitored (future implementation)


## Key Features
- Java and Bedrock support

- Multi-user management via Pterodactyl
- Modular and scalable architecture
- Resilient infrastructure (critical services separated)


## Scalability
- Add new game servers via Pterodactyl Panel and register them in Velocity config.
- Add new nodes by installing Wings and connecting to the shared network.


## Server Requirements
- Minimum: 4 CPU cores, 16 GB RAM, 100 GB SSD
- Recommended: 8 CPU cores, 32 GB RAM, 500 GB SSD

## Current Server Hardware (single host)
- **CPU**: Intel Xeon-D 1520 (4c/8t, 2.2/2.6 GHz)
- **RAM**: 32 GB ECC 2133 MHz
- **Storage**: 2×480 GB SSD SATA (software RAID)

## Installation Overview
1. Prepare the server (install Docker, Docker Compose, dependencies)
2. Install Pterodactyl Panel and Wings
3. Configure Wings to use the shared Docker network
4. Deploy infrastructure services with Docker Compose
5. Add and manage game servers via the Pterodactyl Panel

---
This document provides a high-level overview of the hybrid architecture for SumerCraft, focusing on simplicity and modularity.
