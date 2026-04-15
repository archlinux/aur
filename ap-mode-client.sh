#!/usr/bin/env bash
# ap-mode-client.sh - laptop-side preparation for MT7927 AP mode benchmarks.
#
# Pairs with ap-mode-test.sh on the AP (MT7927) side. Prepares the laptop
# for a clean, reproducible throughput measurement:
#   - records kernel, driver, wifi chip, power/thermal state
#   - disables WiFi power save (common throughput killer on clients)
#   - sets CPU governor to performance for the duration
#   - kills any stray iperf3 processes
#   - disconnects from the current WiFi network
#   - connects to the MT7927-Test hotspot
#   - verifies association, DHCP lease, and AP reachability
#   - starts iperf3 server bound to the WiFi interface
#   - writes a full diagnostic log to /tmp
#
# Usage:
#   sudo ./ap-mode-client.sh                      # connect + prepare
#   sudo ./ap-mode-client.sh --restore            # disconnect + reconnect home
#   sudo ./ap-mode-client.sh --ssid=X --password=Y
#
# Environment overrides (alternative to flags):
#   SSID, PASSPHRASE, HOME_SSID, AP_IP, IPERF_PORT

set -euo pipefail

# ---------------------------------------------------------------------------
# Defaults
# ---------------------------------------------------------------------------
SSID="${SSID:-MT7927-Test}"
PASSPHRASE="${PASSPHRASE:-mt7927test}"
HOME_SSID="${HOME_SSID:-Falcon}"
AP_IP="${AP_IP:-10.0.0.1}"
IPERF_PORT="${IPERF_PORT:-5201}"
WAIT_FOR_ASSOC=30
WAIT_FOR_DHCP=20
LOGFILE="/tmp/ap-mode-client-$(date +%Y%m%d-%H%M%S).log"
MODE="prepare"

# ---------------------------------------------------------------------------
# Parse arguments
# ---------------------------------------------------------------------------
for arg in "$@"; do
	case "$arg" in
	--restore) MODE="restore" ;;
	--ssid=*) SSID="${arg#*=}" ;;
	--password=*) PASSPHRASE="${arg#*=}" ;;
	--home-ssid=*) HOME_SSID="${arg#*=}" ;;
	--ap-ip=*) AP_IP="${arg#*=}" ;;
	--port=*) IPERF_PORT="${arg#*=}" ;;
	-h | --help)
		sed -n '2,22p' "$0" | sed 's/^# \?//'
		exit 0
		;;
	*)
		echo >&2 "Unknown argument: $arg"
		exit 1
		;;
	esac
done

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
log() { printf '[%s] %s\n' "$(date '+%H:%M:%S')" "$*" | tee -a "$LOGFILE"; }
die() {
	log "ERROR: $*"
	exit 1
}

# ---------------------------------------------------------------------------
# Root check
# ---------------------------------------------------------------------------
if ((EUID != 0)); then
	die "Must run as root (sudo $0)"
fi

# ---------------------------------------------------------------------------
# Detect WiFi interface (first phy80211-backed netdev)
# ---------------------------------------------------------------------------
IFACE=""
for dev in /sys/class/net/*/phy80211; do
	[ -d "$dev" ] || continue
	IFACE="$(basename "$(dirname "$dev")")"
	break
done
[[ -n "$IFACE" ]] || die "No WiFi interface detected"

# ---------------------------------------------------------------------------
# Log header (always write, regardless of mode)
# ---------------------------------------------------------------------------
{
	echo "================================================================"
	echo "  AP Mode Client Prep"
	echo "================================================================"
	echo "Timestamp:     $(date)"
	echo "Mode:          $MODE"
	echo "Target SSID:   $SSID"
	echo "Home SSID:     $HOME_SSID"
	echo "AP IP:         $AP_IP"
	echo "iperf3 port:   $IPERF_PORT"
	echo ""
	echo "Host:          $(uname -rn)"
	echo "Hardware:      $(cat /sys/class/dmi/id/product_name 2>/dev/null || echo '?')"
	echo "BIOS:          $(cat /sys/class/dmi/id/bios_version 2>/dev/null || echo '?')"
	echo "Interface:     $IFACE"
	echo "Driver:        $(ethtool -i "$IFACE" 2>/dev/null | awk -F': ' '/^driver/{print $2}')"
	echo "WiFi chip:     $(lspci -nn 2>/dev/null | grep -iE 'network|wireless' | head -1)"
	echo "AC adapter:    $(cat /sys/class/power_supply/AC*/online 2>/dev/null | head -1 || echo '?')"
	thermal=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null || echo 0)
	echo "CPU temp:      $((thermal / 1000))C"
	echo "================================================================"
	echo ""
} >>"$LOGFILE"

log "Log: $LOGFILE"
log "Interface: $IFACE"

# ---------------------------------------------------------------------------
# Restore mode: disconnect and reconnect to home network
# ---------------------------------------------------------------------------
if [[ "$MODE" == "restore" ]]; then
	log "Killing any iperf3 server..."
	pkill iperf3 2>/dev/null || true

	log "Disconnecting from current WiFi..."
	nmcli device disconnect "$IFACE" 2>/dev/null || true
	sleep 2

	log "Reconnecting to home SSID '$HOME_SSID'..."
	if nmcli -t -f NAME connection show | grep -Fxq "$HOME_SSID"; then
		nmcli connection up "$HOME_SSID" ifname "$IFACE" >>"$LOGFILE" 2>&1 ||
			die "Failed to reactivate saved connection '$HOME_SSID'"
	else
		nmcli device wifi connect "$HOME_SSID" ifname "$IFACE" >>"$LOGFILE" 2>&1 ||
			die "No saved profile for '$HOME_SSID' and connect failed"
	fi

	sleep 3
	log "---- restored link state ----"
	iw dev "$IFACE" link 2>/dev/null | tee -a "$LOGFILE"
	log "Done. Full log at: $LOGFILE"
	exit 0
fi

# ---------------------------------------------------------------------------
# Prepare mode: clean state + connect + start iperf3 server
# ---------------------------------------------------------------------------

# -- Disable WiFi power save --------------------------------------------------
log "Disabling WiFi power save on $IFACE..."
iw dev "$IFACE" set power_save off 2>>"$LOGFILE" || true
ps_state=$(iw dev "$IFACE" get power_save 2>/dev/null | awk '{print $NF}')
log "Power save: $ps_state"

# -- CPU governor to performance ---------------------------------------------
log "Setting CPU governor to performance..."
orig_governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null || echo "unknown")
changed_governor=0
for g in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
	if [[ -w "$g" ]] && echo performance >"$g" 2>/dev/null; then
		changed_governor=1
	fi
done
new_governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null || echo "unknown")
log "Governor: $orig_governor -> $new_governor"
if ((changed_governor == 0)) && [[ "$orig_governor" != "performance" ]]; then
	log "WARNING: Could not change CPU governor (may be managed by power-profiles-daemon)"
fi

# -- Kill stray iperf3 -------------------------------------------------------
log "Killing stray iperf3 processes..."
pkill iperf3 2>/dev/null || true
sleep 1

# -- Disconnect from current WiFi --------------------------------------------
current_ssid=$(iw dev "$IFACE" link 2>/dev/null | awk '/^\s*SSID:/{print $2}')
if [[ -n "$current_ssid" && "$current_ssid" != "$SSID" ]]; then
	log "Disconnecting from '$current_ssid'..."
	nmcli device disconnect "$IFACE" 2>>"$LOGFILE" || true
	sleep 2
fi

# -- Rescan (helps NetworkManager see the new AP) ----------------------------
log "Scanning for '$SSID'..."
nmcli device wifi rescan ifname "$IFACE" 2>/dev/null || true
sleep 3
if ! nmcli -t -f SSID device wifi list ifname "$IFACE" 2>/dev/null | grep -Fxq "$SSID"; then
	log "WARNING: '$SSID' not visible in scan results. Connection may fail."
fi

# -- Connect -----------------------------------------------------------------
log "Connecting to '$SSID'..."
if ! nmcli device wifi connect "$SSID" password "$PASSPHRASE" ifname "$IFACE" >>"$LOGFILE" 2>&1; then
	die "Failed to connect to $SSID - is the AP running? Check with 'nmcli device wifi list'"
fi

# -- Wait for association ----------------------------------------------------
log "Waiting up to ${WAIT_FOR_ASSOC}s for association..."
for ((i = 0; i < WAIT_FOR_ASSOC; i++)); do
	assoc_ssid=$(iw dev "$IFACE" link 2>/dev/null | awk '/^\s*SSID:/{print $2}')
	if [[ "$assoc_ssid" == "$SSID" ]]; then
		log "Associated after ${i}s"
		break
	fi
	sleep 1
done
if [[ "$(iw dev "$IFACE" link 2>/dev/null | awk '/^\s*SSID:/{print $2}')" != "$SSID" ]]; then
	die "Failed to associate with $SSID"
fi

# -- Wait for DHCP lease -----------------------------------------------------
log "Waiting up to ${WAIT_FOR_DHCP}s for DHCP lease..."
for ((i = 0; i < WAIT_FOR_DHCP; i++)); do
	if ip -4 addr show "$IFACE" | grep -q 'inet '; then
		break
	fi
	sleep 1
done
ipaddr=$(ip -4 addr show "$IFACE" | awk '/inet /{print $2}' | head -1)
[[ -n "$ipaddr" ]] || die "No DHCP lease after ${WAIT_FOR_DHCP}s"
log "Client IP: $ipaddr"

# -- Verify reachability to AP -----------------------------------------------
log "Pinging AP at $AP_IP (3 packets)..."
if ping -c 3 -W 2 -I "$IFACE" "$AP_IP" >>"$LOGFILE" 2>&1; then
	rtt=$(grep 'rtt min/avg/max' "$LOGFILE" | tail -1)
	log "Ping OK: $rtt"
else
	die "Cannot ping AP $AP_IP - link is up but path is broken"
fi

# -- Warm-up burst pings -----------------------------------------------------
#
# First few frames after association can take 100-1000ms (we saw 1031ms on one
# run). This burst pushes 10s of continuous small packets to let the client's
# rate-control firmware exit the cold-start state before the AP runs its own
# warm-up iperf3. Without this, the first AP-side benchmark captures the
# ramp-up period.
log "Warming up link with burst pings (10s)..."
timeout 10 ping -f -W 1 -I "$IFACE" "$AP_IP" >/dev/null 2>&1 || true
# Note: the inner "|| true" is required because pipefail + set -e would
# otherwise exit the script if the short ping loses any packets.
warmup_rtt=$(timeout 3 ping -c 5 -W 1 -I "$IFACE" "$AP_IP" 2>/dev/null | awk -F'/' '/rtt/{print $5}' || true)
log "Post-warm-up avg RTT: ${warmup_rtt:-unknown} ms"

# Extra settle before iperf3 server starts
log "Settling for 5s..."
sleep 5


# -- Capture link state -------------------------------------------------------
{
	echo ""
	echo "---- iw link ----"
	iw dev "$IFACE" link 2>/dev/null
	echo ""
	echo "---- iw station dump ----"
	iw dev "$IFACE" station dump 2>/dev/null
	echo ""
} >>"$LOGFILE"

rate=$(iw dev "$IFACE" link 2>/dev/null | awk '/tx bitrate:/{print $3, $4}')
rx_rate=$(iw dev "$IFACE" link 2>/dev/null | awk '/rx bitrate:/{print $3, $4}')
signal=$(iw dev "$IFACE" link 2>/dev/null | awk '/signal:/{print $2, $3}')
log "Link: signal=$signal tx=$rate rx=$rx_rate"

# -- Start iperf3 server ------------------------------------------------------
iperf3_log="/tmp/iperf3-server-$(date +%Y%m%d-%H%M%S).log"
log "Starting iperf3 server on port $IPERF_PORT..."
nohup iperf3 -s -p "$IPERF_PORT" >"$iperf3_log" 2>&1 &
IPERF_PID=$!
sleep 1
if ! kill -0 "$IPERF_PID" 2>/dev/null; then
	tail -5 "$iperf3_log" | tee -a "$LOGFILE"
	die "iperf3 server failed to start"
fi
log "iperf3 server running (PID: $IPERF_PID, log: $iperf3_log)"

# -- Final summary ------------------------------------------------------------
{
	echo ""
	echo "================================================================"
	echo "  READY FOR BENCHMARK"
	echo "================================================================"
	echo "Client IP:       $ipaddr"
	echo "AP IP:           $AP_IP"
	echo "iperf3 port:     $IPERF_PORT"
	echo "iperf3 PID:      $IPERF_PID"
	echo "Signal:          $signal"
	echo "TX bitrate:      $rate"
	echo "RX bitrate:      $rx_rate"
	echo "Power save:      $ps_state"
	echo "CPU governor:    $new_governor"
	echo "================================================================"
} | tee -a "$LOGFILE"

log ""
log "Client ready. Run 'sudo ./ap-mode-test.sh' on the AP now."
log "When done: sudo $0 --restore (reconnects to '$HOME_SSID', stops iperf3)"
log ""
log "Full log: $LOGFILE"
