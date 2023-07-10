
#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/csbooks/csbooks.asar "$@"
else
    exec electron --no-sandbox /opt/csbooks/csbooks.asar "$@"
fi