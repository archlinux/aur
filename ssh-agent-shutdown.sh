#!/bin/sh

if [ -n "${SSH_AGENT_PID}" ]; then
 kill ${SSH_AGENT_PID}
 unset SSH_AGENT_PID SSH_AUTH_SOCK
fi
