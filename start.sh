 #!/bin/bash

export LD_LIBRARY_PATH=/opt/wolai:$LD_LIBRARY_PATH
/opt/wolai//wolai -start $1
