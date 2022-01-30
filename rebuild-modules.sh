#! /bin/bash

set -e

if [ -z "$NW_PACKAGE_DIR" ]; then
    echo -e "\e[1;31m\$NW_PACKAGE_DIR is empty\e[0m" >&2
    exit 1
fi

if [ -z "$NW_VERSION" ]; then
    echo -e "\e[1;31m\$NW_VERSION is empty\e[0m" >&2
    exit 1
fi

TEMP_DIR=$(mktemp -d)
trap "{ rm -rf $TEMP_DIR; }" EXIT

# prepare python2
# fix https://github.com/nwjs/nw-gyp/issues/122
ln -sf "$(which python2)" "$TEMP_DIR/python"
export PATH=$TEMP_DIR:$PATH

node_modules="$NW_PACKAGE_DIR/node_modules"
dry_run="n"

if [ ! -d "$node_modules" ]; then
    echo -e "\e[1;31m$node_modules is not exist\e[0m" >&2
    exit 1
fi


rm -fr "${NW_PACKAGE_DIR}/node_modules/vscode-windows-ca-certs" # the module is only available in windows
rm -fr "${NW_PACKAGE_DIR}/node_modules/vscode-windows-registry" # the module is only available in windows
rm -fr "${NW_PACKAGE_DIR}/node_modules/vscode-windows-registry-node" # the module is only available in windows
rm -fr "${NW_PACKAGE_DIR}/node_modules/windows-process-tree" # the module is only available in windows

rm -fr "${NW_PACKAGE_DIR}/node_modules/vscode-ripgrep/bin" # redownload bin on linux

rm -fr "${NW_PACKAGE_DIR}/node_modules/node-pty" "${NW_PACKAGE_DIR}/node_modules/node-pty-node" # the native module is not available in windows

(cd "${NW_PACKAGE_DIR}/node_modules" && find -name *.pdb | xargs -I{} rm -r {}) # remove pdb debugging file

rm -fr "${NW_PACKAGE_DIR}/node_modules_tmp" # remove previous hacking tmp 
mkdir -p "${NW_PACKAGE_DIR}/node_modules_tmp"
cp -fr "${NW_PACKAGE_DIR}/node_modules" "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules" 

rm -fr "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/node-pty"
rm -fr "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/node-pty-node"
rm -fr "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/native-watchdog"
rm -fr "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/oniguruma-node"
rm -fr "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/spdlog"
rm -fr "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/spdlog-node"

(npm install \
    extract-file-icon \
    native-keymap \
    node-pty \
    native-watchdog \
    oniguruma \
    spdlog@0.11.1 \
    trash \
    vscode-oniguruma \
    vscode-ripgrep \
    nodegit \
    --prefix="${NW_PACKAGE_DIR}/node_modules_tmp" \
    --registry=https://registry.npm.taobao.org \
    --nodegit_binary_host_mirror=https://npm.taobao.org/mirrors/nodegit/v0.27.0/) # reinstall modules

# rebuild
echo "nw-gyp version: $( nw-gyp --version )"
cd "$NW_PACKAGE_DIR/node_modules_tmp/node_modules/node-pty" && nw-gyp rebuild --arch=x64 "--target=$NW_VERSION"
(cp -fr "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/node-pty" "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/node-pty-node")
rm -rf "${NW_PACKAGE_DIR}/node_modules/node-pty" "${NW_PACKAGE_DIR}/node_modules/node-pty-node"
cp -fr "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/node-pty" "${NW_PACKAGE_DIR}/node_modules"
(cp -fr "${NW_PACKAGE_DIR}/node_modules/node-pty" "${NW_PACKAGE_DIR}/node_modules/node-pty-node")

cd "$NW_PACKAGE_DIR/node_modules_tmp/node_modules/native-watchdog" && nw-gyp rebuild --arch=x64 "--target=$NW_VERSION"
rm -rf "${NW_PACKAGE_DIR}/node_modules/native-watchdog" && cp -fr "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/native-watchdog" "${NW_PACKAGE_DIR}/node_modules"

(cp -fr "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/oniguruma" "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/oniguruma-node")
(cp -fr "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/spdlog" "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/spdlog-node")

(cd "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules" && find -name "obj.target" | xargs -I{} rm -rf {})
(cd "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules" && find -name "*.node" | xargs -I{} cp -rf {} ${NW_PACKAGE_DIR}/node_modules/{})

mkdir -p "${NW_PACKAGE_DIR}/node_modules/vscode-ripgrep/bin"
cp -fr "${NW_PACKAGE_DIR}/node_modules_tmp/node_modules/vscode-ripgrep/bin/rg" "${NW_PACKAGE_DIR}/node_modules/vscode-ripgrep/bin/rg"

rm -rf "${NW_PACKAGE_DIR}/node_modules_tmp"
