#!/bin/sh

SSH_AGENT=/usr/bin/ssh-agent
## Run ssh-agent only if not already running, and available
if [ -x "${SSH_AGENT}" ] ; then

 if [ -z "${SSH_AGENT_PID}" ]; then
 eval "$(${SSH_AGENT} -s)"
 fi

fi
