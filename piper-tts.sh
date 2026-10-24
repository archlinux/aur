#!/bin/sh
export LD_LIBRARY_PATH="/opt/piper-tts:${LD_LIBRARY_PATH}"
exec /opt/piper-tts/piper "$@"
