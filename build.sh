#!/bin/sh

virtualenv --python /usr/bin/python2 .proxyenv
source .proxyenv/bin/activate

# Choose the right requirementes file based on interpret major/minor
# version. This split is required by asyncssh
PYTHON_VER=`python -c 'import sys; print(str(sys.version_info[0])+"."+str(sys.version_info[1]))'`
python -m pip install -r requirements.txt
python -m pip install -e stratum

pyinstaller -F stratum-mining-proxy/mining_proxy.py --name stratum-mining-proxy
