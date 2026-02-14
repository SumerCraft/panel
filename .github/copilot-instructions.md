# Copilot Instructions for SumerCraft

## Project Overview
SumerCraft is a modular Minecraft network using a hybrid architecture:
- **Pterodactyl Panel + Wings**: For managing Minecraft game servers (Lobby, Survival, Plots, etc.)
- **Docker Compose**: For critical infrastructure (Velocity Proxy)
- All services communicate via a shared Docker network (`mcnet`).

## Key Conventions
- **Velocity Proxy** (Docker Compose): Always runs outside Pterodactyl for stability and advanced networking.
- **Game Servers** (Pterodactyl): Managed via web UI, use Eggs for Paper/Fabric, must share the `forwarding-secret` with Velocity.
- **Backups**: World backups are managed by Pterodactyl; config backups for Velocity are handled via Docker volumes.

## Folder Structure

Recommended folder structure for this hybrid solution:

```
.
├── .github/
│   └── copilot-instructions.md
├── README.md
├── docs/
│   └── arquitectura.md
├── compose/
│   ├── docker-compose-proxy.yml        # Velocity Proxy
│   ├── docker-compose-logs.yml         # (future) Monitoring stack
│   ├── docker-compose-mc-backup.yml    # Backups (optional)
│   └── docker-compose-pterodactyl.yml  # Panel + DB + Redis
├── pterodactyl/
│   ├── eggs/                           # Custom Eggs (JSON)
│   ├── panel-config/                   # Panel config, env, scripts
│   └── wings-config/                   # Wings config.yml, scripts
├── velocity/
│   ├── velocity.toml
│   ├── forwarding.secret
│   └── plugins/
├── grafana/         # (future) Monitoring
├── loki/            # (future) Monitoring
├── alloy/           # (future) Monitoring
├── backups/
│   ├── worlds/
│   └── configs/
├── scripts/
│   └── restart.sh
└── data/                               # Persistent volumes (if needed)
```

## Best Practices
- Keep Velocity configuration and secrets versioned (but never commit real secrets).
- Use the same `mcnet` Docker network for all services.
- When adding a new MC server, always:
  1. Register it in Velocity's config.
  2. Use the same `forwarding-secret`.
  3. Expose it on `mcnet`.

## Example Workflow
1. Add a new game server via Pterodactyl Panel (using the correct Egg).
2. Update `velocity.toml` in `velocity-config/` to register the new backend.
3. Restart Velocity proxy via Docker Compose.
4. (Optional) Confirm logs and metrics appear in monitoring stack (if implemented).

## Style and Naming
- Use English for code, configs, and comments.
- Use snake_case for file and folder names.
- Use clear, descriptive service names in Compose and Pterodactyl.

## What NOT to do
- Do not run Velocity inside Pterodactyl.
- Do not expose secrets in the repository.
- Do not mix unrelated services in the same Compose file.

---
This file is intended to help Copilot and contributors understand the architecture, conventions, and best practices for this project. Update as the project evolves.
