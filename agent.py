#!/usr/bin/python
"""Start the agent of SOGo 6: the Celery worker (worker) or its scheduler (beat).

Upstream's Poetry scripts `agent` and `agent-beat`, for SOGo installed in /usr/share/sogo6-server
instead of site-packages, where its top-level package `app` would be a bad neighbour.
"""

import sys

sys.path.insert(0, "/usr/share/sogo6-server")

from app.agent.run import beat, main

COMMANDS = {"worker": main, "beat": beat}

if __name__ == "__main__":
    if len(sys.argv) != 2 or sys.argv[1] not in COMMANDS:
        sys.exit(f"usage: {sys.argv[0]} worker|beat")
    COMMANDS[sys.argv[1]]()
