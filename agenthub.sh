#!/bin/sh
# AgentHub desktop launcher — just exec the bundled Electron binary,
# preserving arguments and letting Electron find its own resources
# relative to the binary path.
exec /opt/agenthub/agenthub "$@"
