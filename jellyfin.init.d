#!/sbin/openrc-run

: ${JELLYFIN_CACHE_DIR:=/var/cache/jellyfin}
: ${JELLYFIN_LOG_DIR:=/var/log/jellyfin}
: ${JELLYFIN_DATA_DIR:=/var/lib/jellyfin}
: ${JELLYFIN_CONFIG_DIR:=/etc/jellyfin}
: ${JELLYFIN_WEB_DIR:=/usr/share/jellyfin-web}

name="Jellyfin"
description="Jellyfin media server"

pidfile="/run/${RC_SVCNAME}.pid"
command="/usr/bin/jellyfin"
command_args="--webdir ${JELLYFIN_WEB_DIR} --logdir ${JELLYFIN_LOG_DIR} --cachedir ${JELLYFIN_CACHE_DIR} --configdir ${JELLYFIN_CONFIG_DIR} --datadir ${JELLYFIN_DATA_DIR} ${JELLYFIN_EXTRA_ARGS}"
command_user="jellyfin:jellyfin"
command_background=true

output_log="${JELLYFIN_LOG_DIR}/stdout.log"
error_log="${JELLYFIN_LOG_DIR}/stderr.log"

rc_ulimit="-n 65536"

depend() {
  need net
  use dns
  after firewall
}

start_pre() {
  checkpath --directory --owner jellyfin:jellyfin --mode 0750 "${JELLYFIN_LOG_DIR}"
  checkpath --directory --owner jellyfin:jellyfin --mode 0750 "${JELLYFIN_CACHE_DIR}"
  checkpath --directory --owner jellyfin:jellyfin --mode 0750 "${JELLYFIN_CONFIG_DIR}"
  checkpath --directory --owner jellyfin:jellyfin --mode 0750 "${JELLYFIN_DATA_DIR}"
}
