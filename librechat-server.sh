#!/bin/bash
set -euo pipefail
# Ensure files are group-writable (664 files, 775 dirs)
umask 0002
# Check if the user is in the librechat group
if ! id -nG "$USER" | grep -qw librechat; then
  echo "Error: You must be a member of the 'librechat' group to run this command." >&2
  exit 1
fi
# Load environment variables
set -a
source /etc/librechat/librechat.env 2>/dev/null || true
set +a
# Run the server
exec node /usr/lib/librechat/api/server/index.js "$@"
