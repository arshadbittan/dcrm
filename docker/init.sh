#!/bin/bash
# Wrapper to ensure /workspace/init.sh exists and delegates to docker/init.sh
set -e

if [ -x "/workspace/docker/init.sh" ]; then
  exec /workspace/docker/init.sh "$@"
fi

# If the expected file isn't present, try the repo-root docker/init.sh path
if [ -x "./docker/init.sh" ]; then
  exec ./docker/init.sh "$@"
fi

echo "ERROR: /workspace/docker/init.sh not found or not executable"
ls -la /workspace || true
exit 1
