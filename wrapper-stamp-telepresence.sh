#!/opt/telepresence/dumb-init /bin/sh

# wrap the virtualenv and extend $PATH to include telepresence

export VIRTUAL_ENV=/opt/telepresence/telepresence-venv
export PATH="${VIRTUAL_ENV}/bin:$PATH"


RUNME=stamp-telepresence


# pass args on
"${VIRTUAL_ENV}/bin/${RUNME}" $@
