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
package_dir="$NW_PACKAGE_DIR"

if [ ! -d "$node_modules" ]; then
    echo -e "\e[1;31m$node_modules is not exist\e[0m" >&2
    exit 1
fi

# 以下原封复制
echo -e "\033[42;37m ######## 版本信息 $(date '+%Y-%m-%d %H:%M:%S') ########\033[0m"
echo "NW VERSION: $NW_VERSION"
echo "nw-gyp version: $( nw-gyp --version )"
echo "node version: $(node --version )"
echo "npm version: $(npm --version )"
python --version

if [[ ! -z $https_proxy || ! -z $http_proxy ]]; then
  echo -e "\033[41;37m 警告: 你设置了代理，这有可能导致安装出现异常 $http_proxy, $https_proxy \033[0m"
fi

rm -fr "${package_dir}/node_modules/vscode-windows-ca-certs" # the module is only available in windows
rm -fr "${package_dir}/node_modules/vscode-windows-registry" # the module is only available in windows
rm -fr "${package_dir}/node_modules/vscode-windows-registry-node" # the module is only available in windows
rm -fr "${package_dir}/node_modules/windows-process-tree" # the module is only available in windows

rm -fr "${package_dir}/node_modules/vscode-ripgrep/bin" # redownload bin on linux

rm -fr "${package_dir}/node_modules/node-pty" "${package_dir}/node_modules/node-pty-node" # the native module is not available in windows

(cd "${package_dir}/node_modules" && find -name *.pdb | xargs -I{} rm -r {}) # remove pdb debugging file

rm -fr "${package_dir}/node_modules_tmp" # remove previous hacking tmp 
mkdir -p "${package_dir}/node_modules_tmp"
cp -fr "${package_dir}/node_modules" "${package_dir}/node_modules_tmp/node_modules" 

rm -fr "${package_dir}/node_modules_tmp/node_modules/node-pty"
rm -fr "${package_dir}/node_modules_tmp/node_modules/node-pty-node"
rm -fr "${package_dir}/node_modules_tmp/node_modules/native-watchdog"
rm -fr "${package_dir}/node_modules_tmp/node_modules/oniguruma-node"
rm -fr "${package_dir}/node_modules_tmp/node_modules/nodegit"
rm -fr "${package_dir}/node_modules_tmp/node_modules/vscode-ripgrep"
rm -fr "${package_dir}/node_modules_tmp/node_modules/spdlog"
rm -fr "${package_dir}/node_modules_tmp/node_modules/spdlog-node"

(cd "${package_dir}/node_modules_tmp" && npm install \
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
    --registry=https://registry.npm.taobao.org \
    --nodegit_binary_host_mirror=https://npm.taobao.org/mirrors/nodegit/v0.27.0/) # reinstall modules

# rebuild
cd "$package_dir/node_modules_tmp/node_modules/node-pty" && nw-gyp rebuild --arch=x64 "--target=$NW_VERSION" --dist-url=https://registry.npmmirror.com/-/binary/nwjs
(cp -fr "${package_dir}/node_modules_tmp/node_modules/node-pty" "${package_dir}/node_modules_tmp/node_modules/node-pty-node")
rm -rf "${package_dir}/node_modules/node-pty" "${package_dir}/node_modules/node-pty-node"
cp -fr "${package_dir}/node_modules_tmp/node_modules/node-pty" "${package_dir}/node_modules"
(cp -fr "${package_dir}/node_modules/node-pty" "${package_dir}/node_modules/node-pty-node")

cd "$package_dir/node_modules_tmp/node_modules/native-watchdog" && nw-gyp rebuild --arch=x64 "--target=$NW_VERSION" --dist-url=https://registry.npmmirror.com/-/binary/nwjs
rm -rf "${package_dir}/node_modules/native-watchdog" && cp -fr "${package_dir}/node_modules_tmp/node_modules/native-watchdog" "${package_dir}/node_modules"

cd "${package_dir}/node_modules_tmp/node_modules/nodegit" && rm -rf .github include src lifecycleScripts vendor utils build/vendor build/Release/.deps
cp -fr "${package_dir}/node_modules_tmp/node_modules/nodegit" "${package_dir}/node_modules"

(cp -fr "${package_dir}/node_modules_tmp/node_modules/oniguruma" "${package_dir}/node_modules_tmp/node_modules/oniguruma-node")
(cp -fr "${package_dir}/node_modules_tmp/node_modules/spdlog" "${package_dir}/node_modules_tmp/node_modules/spdlog-node")

(cd "${package_dir}/node_modules_tmp/node_modules" && find -name "obj.target" | xargs -I{} rm -rf {})
(cd "${package_dir}/node_modules_tmp/node_modules" && find -name "*.node" | xargs -I{} cp -rf {} ${package_dir}/node_modules/{})

mkdir -p "${package_dir}/node_modules/vscode-ripgrep/bin"
cp -fr "${package_dir}/node_modules_tmp/node_modules/vscode-ripgrep/bin/rg" "${package_dir}/node_modules/vscode-ripgrep/bin/rg"

rm -rf "${package_dir}/node_modules_tmp"

# 移除旧配置
# rm -fr ~/.config/wechat_devtools
