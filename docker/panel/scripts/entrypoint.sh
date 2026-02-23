#!/bin/sh

# Create .blueprintrc with nginx configuration
cat <<EOF > /app/.blueprintrc
WEBUSER="nginx";
OWNERSHIP="nginx:nginx";
USERSHELL="/bin/sh";
PERMISSIONS="u=rwX,g=rX,o=rX";
EOF
chown nginx:nginx /app/.blueprintrc && chmod 644 /app/.blueprintrc

# Ensure node_modules/.bin is executable
chmod -R +x /app/node_modules/.bin

# Run Blueprint install only the first time
if [ ! -f /app/.blueprint_installed ]; then
	[ -x /app/blueprint.sh ] && bash /app/blueprint.sh
	touch /app/.blueprint_installed
fi

# Launch the original image entrypoint
exec /bin/ash .github/docker/entrypoint.sh "$@"
