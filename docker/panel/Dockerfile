
FROM ghcr.io/pterodactyl/panel:v1.11.11

RUN apk add --no-cache curl nodejs npm yarn
# Copy plugin manager to /app-default
RUN git clone --depth=1 https://github.com/imTheoDoR/pterodactyl-plugin-manager.git /tmp/plugin && mkdir -p /app-default && cp -r /tmp/plugin/* /app-default && rm -rf /tmp/plugin
# Copy entrypoint script
COPY docker/panel/scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# Use custom entrypoint
ENTRYPOINT ["/entrypoint.sh"]
