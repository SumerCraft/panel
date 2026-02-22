# Nodes and Servers Planning

## Nodes

| Node              | Total Memory (MiB) | Memory Overallocate (%) | Disk Space (MiB) | Disk Overallocate (%) |
|-------------------|--------------------|-------------------------|------------------|-----------------------|
| Node-1            | 24576              | 120                     | 768000           | 120                   |
| Node-2 (optional) | 24576              | 120                     | 768000           | 120                   |

- *Adjust values according to your hardware. 24576 MiB ≈ 24 GB RAM, 768000 MiB ≈ 750 GB disk.*
- *Node-2 (optional) is for planning a second dedicated server or VPS, separate from Node-1. Add more rows as you scale to additional physical or virtual machines.*

---

## Servers

| Server           | CPU Limit (%) | CPU Pinning | Memory (MiB) | Swap (MiB) | Disk Space (MiB) | Block IO Weight | OOM Killer |
|------------------|---------------|-------------|--------------|------------|------------------|-----------------|------------|
| Velocity Java    | 200           |             | 1024         | 0          | 2048             | 500             | Yes        |
| Velocity Bedrock | 200           |             | 1024         | 0          | 2048             | 500             | Yes        |
| Lobby            | 200           |             | 1024         | 0          | 2048             | 500             | Yes        |
| Lobby 2          | 200           |             | 1024         | 0          | 2048             | 500             | Yes        |
| Plot Creative    | 200           |             | 4096         | 0          | 20480            | 500             | Yes        |
| Survival         | 200           |             | 4096         | 0          | 20480            | 500             | Yes        |
| Arena PvP        | 100           |             | 2048         | 0          | 10240            | 500             | Yes        |
| Skywars          | 100           |             | 2048         | 0          | 10240            | 500             | Yes        |


- **CPU Limit:** 100 = 1 core/thread, 200 = 2 cores/threads, etc.
- **CPU Pinning:** Leave blank to allow all threads.
- **OOM Killer:** Yes = enabled (recommended to avoid hangs due to memory overuse).

---

## Network and Backend Summary Table

| Service   | Panel Allocation        | server.properties | Velocity backend address  | Publicly Exposed? |
|-----------|-------------------------|-------------------|---------------------------|-------------------|
| Velocity  | Public IP:26510         | N/A               | N/A                       | Yes               |
| Lobby     | 127.0.0.1:26520         | 0.0.0.0:26520     | <container_name>:26520    | No                |

_The easiest way to find the correct value for <container_name> is to use the UUID shown in the Pterodactyl panel under the server list. This UUID matches the container name in Docker._

---

## World Seeds

This section lists the Minecraft world seeds for each server. Add or update seeds as needed for your environment.

| Server        | World Seed           |
|---------------|----------------------|
| Plot Creative |                      |
| Survival      | 7822881847993768055  |
| Arena PvP     |                      |
| Skywars       |                      |

---

*This file helps you plan the nodes and servers to create, with recommended configuration for each.*

---

## Example: Server Distribution Across Two Nodes

If you have two dedicated servers, a simple and effective way to distribute the load is to split them evenly, for example:

**Node 1:**
- Velocity Java
- Lobby 1
- Survival
- Skywars

**Node 2:**
- Velocity Bedrock
- Lobby 2
- Plot Creative
- Arena PvP

This approach helps balance memory, CPU, and disk usage. Adjust the distribution as needed based on real usage and server performance.
