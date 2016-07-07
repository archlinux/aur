if [ -n "${BASH_VERSION:-}" -o -n "${ZSH_VERSION:-}" ] ; then
    export PYTHONZ_ROOT=/opt/pythonz
    source "${PYTHONZ_ROOT}/etc/bashrc"
fi
