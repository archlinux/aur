#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron25 /opt/excel-parser-processor/excel-parser-processor.asar "$@"
else
    exec electron25 --no-sandbox /opt/excel-parser-processor/excel-parser-processor.asar "$@"
fi