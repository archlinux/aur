
#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/icalingua++/icalingua++.asar "$@"
else
    exec electron --no-sandbox /opt/icalingua++/icalingua++.asar "$@"
fi