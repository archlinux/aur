#!/bin/sh
cd '/usr/share/battlejump/'
BJLAUNCHER=0
BJEDITOR=0
BJLEVELMANAGER=0
PARAMATERS=()
for i in $@; do
    case "$i" in
        "--")
            break;;
        "-l"|"--launcher")
            BJLAUNCHER=1;;
        "-e"|"--editor")
            BJEDITOR=1;;
        "-m"|"--levelmanager")
            BJLEVELMANAGER=1;;
        "-h"|"--help")
            echo "$0 [options]"
            echo -e "\t-h, --help\t\tDisplays this help"
            echo -e "\t-l, --nolauncher\tStart with launcher"
            echo -e "\t-e, --editor\t\tLevel editor"
            echo -e "\t-m, --levelmanager\tLevel manager"
            exit;;
        *)
            PARAMETERS+=("$i");;
    esac
done
if [ "$BJEDITOR" -ne 0 ]; then
    echo "Testing the level via run is currently broken!"
    echo "Please start game independently."
    ./BattleJumpEditor ${PARAMATERS[@]:-}
elif [ "$BJLEVELMANAGER" -ne 0 ]; then
    echo "Testing the level via run is currently broken!"
    echo "Please start game independently."
    ./BattleJumpLevelManager ${PARAMATERS[@]:-}
elif [ "$BJLAUNCHER" -ne 0 ]; then
    echo "Starting the game via the launcher is currently broken!"
    echo "Please start game independently."
    ./BattleJumpLauncher ${PARAMATERS[@]:-}
else
    LD_PRELOAD=libcurl.so.3 ./BattleJump ${PARAMATERS[@]:-}
fi
