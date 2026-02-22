
# SumerCraft

SumerCraft is a Minecraft server network that uses a hybrid architecture to combine the best of professional management (Pterodactyl Panel) and critical infrastructure (Docker Compose).

## General Architecture

- **Pterodactyl Panel + Wings**: All game servers and proxy services (including Velocity for Java and Bedrock).
- **Velocity Proxies (Java & Bedrock)**: Both proxies are available as separate services. The Bedrock proxy is always kept updated to the latest supported version.

## Advantages of the hybrid approach

- **Stability and control**: All proxies and servers are managed from Pterodactyl, ensuring unified configuration and uptime.
- **Easy management and community support**: All services are managed from Pterodactyl, which is widely used and documented.
- **Scalability and modularity**: It's easy to add new servers or proxy instances as the network grows.

## Main components

- Velocity Proxy Java (Pterodactyl)
- Velocity Proxy Bedrock (Pterodactyl, always latest Bedrock-supported version)
- Paper/Fabric/Plots Servers (Pterodactyl)
- Pterodactyl Panel + Wings (web management and daemon)

## Current server hardware (single host)

- **CPU**: Intel Xeon-D 1520 (4c/8t, 2.2/2.6 GHz)
- **RAM**: 32 GB ECC 2133 MHz
- **Storage**: 2×480 GB SSD SATA (software RAID)

---


## Documentation

- [Architecture Overview](docs/architecture.md)
- [Plugins and Additional Software](docs/plugins_and_tools.md)
- [Nodes and Servers Planning](docs/nodes_and_servers.md)

---
This README summarizes the architecture and purpose of the project to make it easier to understand and onboard new sessions or collaborators.
