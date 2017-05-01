#!/bin/sh

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib/openssl-1.0-compat/:/usr/lib/securefx/
exec /usr/lib/securefx/SecureFX "${@}"
