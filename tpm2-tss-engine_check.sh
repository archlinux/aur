#!/bin/sh

# Start TPM simulator
tpm_server >/dev/null &
trap "kill $!" EXIT

export TPM2TSSENGINE_TCTI=libtss2-tcti-mssim.so
export TPM2TOOLS_TCTI=mssim
make --jobs=1 check
