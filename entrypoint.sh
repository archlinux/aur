#!/usr/bin/env bash
# T3 Code Docker container entrypoint.
#
# For each configured provider (T3_<PROVIDER>_URL env var), starts a socat
# proxy that listens on a fixed container-internal port and forwards to the
# provider's actual URL outside the container.
#
# The operator sets T3_OPENCODE_URL=http://localhost:8096/ at build time.
# From inside the bridge-networked container, localhost = the container's
# own loopback, not the host. We substitute localhost/127.0.0.1 →
# host.docker.internal so socat can actually reach the host.
set -euo pipefail

# Internal ports reserved per provider (same across all instances).
# Format: PROVIDER_NAME → port
declare -A PORT_FOR=(
  [OPENCODE]=4096
  [CODEX]=4097
  [CLAUDE]=4098
  [GROK]=4099
)

for PROVIDER in OPENCODE CODEX CLAUDE GROK; do
  URL_VAR="T3_${PROVIDER}_URL"
  URL="${!URL_VAR:-}"
  [ -n "${URL}" ] || continue

  # Parse http://HOST:PORT/ → HOST:PORT then split
  HOST_PORT=$(echo "${URL}" | sed -E 's|^https?://([^/:]+)(:[0-9]+)?/?.*|\1\2|')
  HOST="${HOST_PORT%%:*}"
  PORT="${HOST_PORT##*:}"
  [ "${PORT}" = "${HOST_PORT}" ] && { echo "error: T3_${PROVIDER}_URL has no port: ${URL}" >&2; exit 1; }

  # Resolve localhost/127.0.0.1 → host.docker.internal so the
  # bridge-networked container can reach the docker host.
  case "${HOST}" in
    localhost|127.0.0.1) HOST="host.docker.internal" ;;
  esac

  LPORT="${PORT_FOR[${PROVIDER}]}"
  echo "[entrypoint] ${PROVIDER}: socat 127.0.0.1:${LPORT} → ${HOST}:${PORT}"
  socat TCP-LISTEN:${LPORT},fork,reuseaddr,bind=127.0.0.1 TCP:${HOST}:${PORT} &
done

exec t3 serve --host 0.0.0.0 --port 3773 --no-browser
