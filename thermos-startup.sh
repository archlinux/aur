source /etc/aurora/thermos-env.sh

exec /usr/bin/thermos_observer "${OBSERVER_ARGS[@]}"
