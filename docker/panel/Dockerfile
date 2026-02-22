FROM ghcr.io/pterodactyl/panel:v1.11.11

RUN apt update && \
    apt install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt install -y nodejs && \
    npm install -g yarn && \
    apt clean && rm -rf /var/lib/apt/lists/*
