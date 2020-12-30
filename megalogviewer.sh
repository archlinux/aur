#!/bin/bash

set -e
cd /usr/lib/megalogviewer
exec /usr/bin/java -jar ./HogLogViewer.jar $@
