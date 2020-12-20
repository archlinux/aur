#!/bin/sh
exec /usr/bin/java -Xmx64G -jar '/usr/share/java/h2o-ai/h2o.jar' -ip localhost "$@"
