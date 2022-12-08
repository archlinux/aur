#!/usr/bin/env bash
#
# nitronD Upstream Tool
#
# Copyright: UsiFX <xprjkts@gmail.com>


URL="https://raw.githubusercontent.com/UsiFX/OpenNitroN"

__help()
{
    echo "
usage: ./$0 [OPTIONS]
options:
  --branch=<BRANCH> ~ clones custom branch
"

}

__main()
{
    if [[ $(curl "${URL}/$BRANCH/nitrond") == "404: Not Found" ]]; then
        echo "error: invaild branch"
        exit 1
    else
        curl -o "nitrond.swp" "${URL}/$BRANCH/nitrond" 2>/dev/null
        curl -o "nitronapi.swp" "${URL}/$BRANCH/nitronapi.sh" 2>/dev/null
        curl -o "nitrond.1.swp" "${URL}/$BRANCH/nitrond.1" 2>/dev/null
    fi

    gzip -q "nitrond.1.swp"

    mv "nitrond.swp" "nitrond"
    mv "nitronapi.swp" "nitronapi.sh"
    mv "nitrond.1.swp.gz" "nitrond.1.gz"
    rm -rf *.swp
    echo "remote: upstream success"
    git commit -asm "treewide: upstream from Source at '$BRANCH'"
}

if [[ $# -eq "0" ]]; then
    tty -s
    BRANCH="main" __main
else
    for args in "$@"
    do
        case "${args}" in
            "--branch="*)
                BRANCH="${args#*=}"
                if [[ -z $BRANCH ]]; then
                    echo "use --branch=<BRANCH_NAME>"
                    exit 1
                else
                    __main
                fi
            ;;
            "--help") __help ;;
            *)  __help; exit 1 ;;
        esac
    done
fi
