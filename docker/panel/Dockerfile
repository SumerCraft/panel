

FROM ghcr.io/pterodactyl/panel:v1.11.11

RUN apk add --no-cache curl nodejs npm yarn
# Copy plugin manager directly to /app
RUN git clone --depth=1 https://github.com/imTheoDoR/pterodactyl-plugin-manager.git /tmp/plugin && cp -r /tmp/plugin/* /app && rm -rf /tmp/plugin
