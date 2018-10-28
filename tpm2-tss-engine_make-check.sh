#!/bin/sh

# Start TPM simulator
tpm_server &
trap "kill $!" EXIT
tpm2_clear --tcti mssim

# https://github.com/tpm2-software/tpm2-tss-engine/issues/41
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$PWD/.libs"

make -k check
