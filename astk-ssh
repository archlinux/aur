#!/bin/bash
eval `ssh-agent`
SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
astk
kill $SSH_AGENT_PID