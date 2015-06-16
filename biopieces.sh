export BP_DIR="/opt/biopieces/"  # Directory where biopieces are installed
export BP_DATA="~/.biopieces/data"   # Contains genomic data etc.
export BP_TMP="/tmp/biopieces"        			  # Required temporary directory.
export BP_LOG="/tmp/biopieces/log"     # Required log directory.

# create log dir
mkdir -p $BP_LOG

if [ -f "$BP_DIR/bp_conf/bashrc" ]; then
    source "$BP_DIR/bp_conf/bashrc"
fi  

