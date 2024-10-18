#!/bin/sh

# The state of gardenctl is bound to a shell session. A shell session is defined by the environment variable GCTL_SESSION_ID.
# see https://github.com/gardener/gardenctl-v2?tab=readme-ov-file#shell-session
[ -n "$GCTL_SESSION_ID" ] || [ -n "$TERM_SESSION_ID" ] || export GCTL_SESSION_ID=$(uuidgen)

