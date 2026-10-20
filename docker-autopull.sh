#!/bin/bash
# Pull skycoin/skywire:test and recreate containers if the image changed.
# Verifies the new binary works before deploying.
# Configure via /etc/skywire.conf or environment:
#   DOCKER_IMAGE    - image to pull (default: skycoin/skywire:test)
#   DEPLOY_DIR      - directory containing docker-compose.yml
set -e

# Source configuration
SKYENV=${SKYENV:-/etc/skywire.conf}
[[ -f "$SKYENV" ]] && source "$SKYENV" # shellcheck source=/etc/skywire.conf

IMAGE="${DOCKER_IMAGE:-skycoin/skywire:test}"
COMPOSE_DIR="${DEPLOY_DIR:-${COMPOSE_DIR:-$(cd "$(dirname "$0")" && pwd)}}"

OLD_ID=$(docker image inspect "$IMAGE" --format '{{.Id}}' 2>/dev/null || echo "none")
docker pull "$IMAGE" -q
NEW_ID=$(docker image inspect "$IMAGE" --format '{{.Id}}' 2>/dev/null || echo "")

if [ "$OLD_ID" = "$NEW_ID" ]; then
    exit 0
fi

# Smoke test: verify the binary in the new image runs
if ! docker run --rm "$IMAGE" --help >/dev/null 2>&1; then
    echo "$(date): New image failed smoke test, skipping update"
    exit 1
fi

echo "$(date): Image updated, recreating the containers that use it"
cd "$COMPOSE_DIR"
# Plain up -d recreates only the containers whose image changed. --force-recreate
# also restarted redis and postgres on every pull, failing the services using them.
docker compose up -d

# Reap dangling images left behind by retag-on-pull. Without this,
# every successful pull-and-recreate cycle leaves the previous image's
# layers untagged on disk, eventually filling / with tens of GB of
# orphaned data. Tagged images and layers still referenced by
# running/stopped containers are untouched, so this is safe to run
# unconditionally on every update cycle.
PRUNED=$(docker image prune -f 2>&1 | tail -n1)
echo "$(date): $PRUNED"
