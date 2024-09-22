#!/bin/bash

verbose='false'

function print_usage {
    echo "Usage: vmcompile [-v] [-h]"
    echo "  -v      Display verbose output."
    echo "  -h      Display this message."
    exit 1
}

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -v|--verbose)
            verbose='true'
            shift
            ;;
        -h|--help)
            print_usage
            ;;
        -*)
            print_usage
            ;;
    esac
done

echo 'Preparing to compile...'

if [[ "$verbose" == 'true' ]]; then
    git clone -b tmp/workstation-17.5.2-k6.9.1 https://github.com/nan0desu/vmware-host-modules.git
else
    git clone -b tmp/workstation-17.5.2-k6.9.1 https://github.com/nan0desu/vmware-host-modules.git > /dev/null 2>&1
fi

cd vmware-host-modules/

if [[ "$verbose" == 'true' ]]; then
    tar -cfv vmmon.tar vmmon-only
    tar -cfv vmnet.tar vmnet-only
else
    tar -cf vmmon.tar vmmon-only > /dev/null 2>&1
    tar -cf vmnet.tar vmnet-only > /dev/null 2>&1
fi

echo 'Copying necessary files...'
if [[ "$verbose" == 'true' ]]; then
    sudo cp -v vmmon.tar vmnet.tar /usr/lib/vmware/modules/source/
else
    sudo cp vmmon.tar vmnet.tar /usr/lib/vmware/modules/source/ > /dev/null 2>&1
fi

echo 'Compiling the modules...'
if [[ "$verbose" == 'true' ]]; then
    sudo vmware-modconfig --console --install-all
else
    sudo vmware-modconfig --console --install-all > /dev/null 2>&1
fi

echo 'Done!'
