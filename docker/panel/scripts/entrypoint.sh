#!/bin/sh
# Copy initial files to /app only if empty
if [ ! "$(ls -A /app)" ]; then
  cp -r /app-default/* /app
fi
# Run original entrypoint
exec /bin/ash .github/docker/entrypoint.sh "$@"
