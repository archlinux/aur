#!/bin/bash
set -euo pipefail

# adapted for arch linux from upstream launch script, based on the guidelines here:
# https://wiki.archlinux.org/title/Java_package_guidelines

SOLVER_ARGS=(
    -minion-bin /usr/lib/savilerow/bin/minion
    -chuffed-bin /usr/lib/savilerow/bin/fzn-chuffed
    -symdetect-bin /usr/lib/savilerow/bin/symmetry_detect
    -kissat-bin /usr/lib/savilerow/bin/kissat
)

JAVA_ARGS=(
    -ea
    -XX:ParallelGCThreads=1
    # -Djava.library.path="$DIR"/lib/
    -Xmx8G
)

case "$@" in
    *"-cgroups"*)
        TIMESTAMP=$(date +%s)
        GROUP_NAME="savilerow_${TIMESTAMP}_$$"

        echo "Using cgroups, group name: $GROUP_NAME"

        cgcreate -g cpu:/"$GROUP_NAME"
        cgset -r cpu.cfs_quota_us=1000000 "$GROUP_NAME"
        cgset -r cpu.cfs_period_us=1000000 "$GROUP_NAME"
        cgexec -g cpu:"$GROUP_NAME" /usr/bin/java "${JAVA_ARGS[@]}" \
            -jar "/usr/share/java/savilerow.jar" "${SOLVER_ARGS[@]}"  "$@"
        cgdelete -g cpu:/"$GROUP_NAME"
    ;;
    *)
        exec /usr/bin/java "${JAVA_ARGS[@]}" \
            -jar "/usr/share/java/savilerow.jar" "${SOLVER_ARGS[@]}" "$@"
    ;;
esac
