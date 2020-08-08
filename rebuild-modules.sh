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

node_modules="$NW_PACKAGE_DIR/node_modules"
dry_run="n"

if [ ! -d "$node_modules" ]; then
    echo -e "\e[1;31m$node_modules is not exist\e[0m" >&2
    exit 1
fi

for mod in "$node_modules"/*; do
    mod_name=$(basename "$mod")
    echo -e "\e[1;34mrebuild $mod_name\e[0m" >&2
    cd "${mod}"

    case "$mod_name" in
    spdlog-node|oniguruma-node|native-keymap|native-watchdog|extract-file-icon|node-pty-node)
        [ "$dry_run" = 'y' ] && continue
        npm install
        ;;
    spdlog|oniguruma|node-pty)
        [ "$dry_run" = 'y' ] && continue
        nw-gyp rebuild --target="${NW_VERSION}"
        ;;
    nodegit)
        [ "$dry_run" = 'y' ] && continue
        mkdir lib
        npm install
        npm run recompile
        ;;
    vscode-ripgrep)
        [ "$dry_run" = 'y' ] && continue
        rm -rf bin
        npm install
        ;;
    vscode-windows-*|windows-*)
        [ "$dry_run" = 'y' ] && continue
        cd "$node_modules"
        rm -rf "${mod}"
        ;;
    trash|vscode-oniguruma)
        [ "$dry_run" = 'y' ] && continue
        ;;
    *)
        echo -e "\e[1;31mcannot rebuild $mod\e[0m" >&2
        exit 1
        ;;
    esac
done

