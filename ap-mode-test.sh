#!/usr/bin/env bash
# AP mode throughput benchmark for MT7927.
# Sets up hostapd at 80 MHz on channel 149, waits for a client, runs iperf3,
# inspects beamforming/station capabilities, then tears down cleanly.
#
# Full output is logged to /tmp/ap-mode-test-<timestamp>.log
# Terminal shows a concise summary.
#
# Usage:
#   sudo ./ap-mode-test.sh                    # defaults
#   sudo ./ap-mode-test.sh -i wlp9s0         # specify interface
#   sudo ./ap-mode-test.sh -c 36             # different channel
#   sudo ./ap-mode-test.sh -t 30             # 30-second iperf3 test
#   sudo ./ap-mode-test.sh -p 8              # 8 parallel streams

set -euo pipefail

# ---------------------------------------------------------------------------
# Defaults
# ---------------------------------------------------------------------------
IFACE=""
CHANNEL=149
CENTER_FREQ_IDX=155
SSID="MT7927-Test"
PASSPHRASE="mt7927test"
COUNTRY="CR"
AP_IP="10.0.0.1"
DHCP_START="10.0.0.100"
DHCP_END="10.0.0.200"
IPERF_DURATION=10
IPERF_STREAMS=4
CLIENT_TIMEOUT=120
HOSTAPD_CONF=""
HOSTAPD_PID=""
DNSMASQ_PID=""
NM_WAS_MANAGING=""
LOGFILE="/tmp/ap-mode-test-$(date +%Y%m%d-%H%M%S).log"

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
# Log to file only
log() { echo "$*" >>"$LOGFILE"; }
# Log to file and terminal
info() {
	echo "[*] $*"
	echo "[*] $*" >>"$LOGFILE"
}
ok() {
	echo "[+] $*"
	echo "[+] $*" >>"$LOGFILE"
}
warn() {
	echo "[!] $*" >&2
	echo "[!] $*" >>"$LOGFILE"
}
die() {
	echo "[FATAL] $*" >&2
	echo "[FATAL] $*" >>"$LOGFILE"
	exit 1
}

# Run a command, show on terminal and log
run_logged() {
	"$@" 2>&1 | tee -a "$LOGFILE"
}

# Run a command, log only (terminal stays quiet)
run_quiet() {
	"$@" >>"$LOGFILE" 2>&1
}

# Section header in log only
log_section() {
	{
		echo ""
		echo "================================================================"
		echo "  $1"
		echo "================================================================"
	} >>"$LOGFILE"
}

# ---------------------------------------------------------------------------
# Usage
# ---------------------------------------------------------------------------
usage() {
	cat <<'EOF'
MT7927 AP Mode Throughput Benchmark

Options:
  -i IFACE      WiFi interface (default: auto-detect from mt7925e)
  -c CHANNEL    5 GHz channel (default: 149)
  -t SECONDS    iperf3 duration (default: 10)
  -p STREAMS    iperf3 parallel streams (default: 4)
  -h            Show this help

Output: full log written to /tmp/ap-mode-test-<timestamp>.log
EOF
	exit 0
}

# ---------------------------------------------------------------------------
# Cleanup - always runs on exit
# ---------------------------------------------------------------------------
cleanup() {
	info "Tearing down AP..."

	if [[ -n "$HOSTAPD_PID" ]] && kill -0 "$HOSTAPD_PID" 2>/dev/null; then
		kill "$HOSTAPD_PID" 2>/dev/null || true
		wait "$HOSTAPD_PID" 2>/dev/null || true
	fi
	killall hostapd 2>/dev/null || true

	if [[ -n "$DNSMASQ_PID" ]] && kill -0 "$DNSMASQ_PID" 2>/dev/null; then
		kill "$DNSMASQ_PID" 2>/dev/null || true
		wait "$DNSMASQ_PID" 2>/dev/null || true
	fi

	if [[ -n "$HOSTAPD_CONF" ]] && [[ -f "$HOSTAPD_CONF" ]]; then
		rm -f "$HOSTAPD_CONF"
	fi
	rm -f /tmp/hostapd-test.pid /tmp/hostapd-test.log /tmp/dnsmasq-test.pid
	rm -rf /var/run/hostapd

	if [[ -n "$IFACE" ]]; then
		ip addr flush dev "$IFACE" 2>/dev/null || true
		ip link set "$IFACE" down 2>/dev/null || true
		sleep 1
		ip link set "$IFACE" up 2>/dev/null || true

		if [[ "$NM_WAS_MANAGING" == "yes" ]]; then
			info "Restoring NetworkManager control of $IFACE..."
			nmcli device set "$IFACE" managed yes 2>/dev/null || true
			sleep 2
			nmcli device wifi rescan 2>/dev/null || true
		fi
	fi

	ok "Cleanup complete."
	ok "Full log: $LOGFILE"
}

trap cleanup EXIT

# ---------------------------------------------------------------------------
# Parse arguments
# ---------------------------------------------------------------------------
while getopts "i:c:t:p:h" opt; do
	case "$opt" in
	i) IFACE="$OPTARG" ;;
	c) CHANNEL="$OPTARG" ;;
	t) IPERF_DURATION="$OPTARG" ;;
	p) IPERF_STREAMS="$OPTARG" ;;
	h) usage ;;
	*) usage ;;
	esac
done

# ---------------------------------------------------------------------------
# Root check
# ---------------------------------------------------------------------------
if [[ $EUID -ne 0 ]]; then
	die "Must run as root (sudo ./ap-mode-test.sh)"
fi

# Initialize log
{
	echo "AP Mode Test - $(date)"
	echo "Command: $0 $*"
	echo "Host: $(uname -rn)"
	pkg_ver=$(pacman -Q mediatek-mt7927-dkms 2>/dev/null | awk '{print $2}')
	if [[ -n "$pkg_ver" ]]; then
		echo "Package: mediatek-mt7927-dkms $pkg_ver"
	fi
	dkms_ver=$(dkms status mediatek-mt7927 2>/dev/null | head -1 | sed 's/,.*//')
	if [[ -n "$dkms_ver" ]]; then
		echo "DKMS: $dkms_ver"
	fi
	echo ""
} >"$LOGFILE"

# ---------------------------------------------------------------------------
# Auto-detect interface
# ---------------------------------------------------------------------------
if [[ -z "$IFACE" ]]; then
	for dev in /sys/bus/pci/drivers/mt7925e/*/net/*; do
		if [[ -d "$dev" ]]; then
			IFACE="$(basename "$dev")"
			break
		fi
	done
	[[ -n "$IFACE" ]] || die "No mt7925e interface found"
fi

info "Interface: $IFACE"

# ---------------------------------------------------------------------------
# Compute center frequency index from channel
# ---------------------------------------------------------------------------
case "$CHANNEL" in
36) CENTER_FREQ_IDX=42 ;;
44) CENTER_FREQ_IDX=42 ;;
52) CENTER_FREQ_IDX=58 ;;
60) CENTER_FREQ_IDX=58 ;;
100) CENTER_FREQ_IDX=106 ;;
108) CENTER_FREQ_IDX=106 ;;
116) CENTER_FREQ_IDX=122 ;;
124) CENTER_FREQ_IDX=122 ;;
132) CENTER_FREQ_IDX=138 ;;
140) CENTER_FREQ_IDX=138 ;;
149) CENTER_FREQ_IDX=155 ;;
157) CENTER_FREQ_IDX=155 ;;
*) die "Unsupported channel $CHANNEL for 80 MHz" ;;
esac

# ---------------------------------------------------------------------------
# Check dependencies
# ---------------------------------------------------------------------------
for cmd in hostapd dnsmasq iperf3 iw ip nmcli; do
	command -v "$cmd" &>/dev/null || die "Missing dependency: $cmd"
done

# ---------------------------------------------------------------------------
# Check if NM is managing the interface
# ---------------------------------------------------------------------------
if nmcli -t -f DEVICE,STATE device 2>/dev/null | grep -q "^${IFACE}:"; then
	NM_WAS_MANAGING="yes"
fi

# ---------------------------------------------------------------------------
# Stop NetworkManager management
# ---------------------------------------------------------------------------
info "Disabling NetworkManager on $IFACE..."
nmcli device set "$IFACE" managed no 2>/dev/null || true
sleep 1

if wpa_cli -i "$IFACE" status &>/dev/null; then
	info "Stopping wpa_supplicant on $IFACE..."
	killall wpa_supplicant 2>/dev/null || true
	sleep 1
fi

# ---------------------------------------------------------------------------
# Generate hostapd config
# ---------------------------------------------------------------------------
HOSTAPD_CONF="$(mktemp /tmp/hostapd-XXXXXX.conf)"

cat >"$HOSTAPD_CONF" <<EOF
interface=$IFACE
driver=nl80211
ctrl_interface=/var/run/hostapd
ssid=$SSID
hw_mode=a
channel=$CHANNEL

# 80 MHz VHT/HE
vht_oper_chwidth=1
vht_oper_centr_freq_seg0_idx=$CENTER_FREQ_IDX
he_oper_chwidth=1
he_oper_centr_freq_seg0_idx=$CENTER_FREQ_IDX

# Standards
ieee80211n=1
ieee80211ac=1
ieee80211ax=1

# HT capabilities
ht_capab=[HT40+][SHORT-GI-20][SHORT-GI-40]

# VHT capabilities (including beamforming)
vht_capab=[SHORT-GI-80][RXLDPC][TX-STBC-2BY1]

# Country
country_code=$COUNTRY

# Security
wpa=2
wpa_passphrase=$PASSPHRASE
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
EOF

log "Generated hostapd config:"
cat "$HOSTAPD_CONF" >>"$LOGFILE"

# ---------------------------------------------------------------------------
# Configure interface
# ---------------------------------------------------------------------------
info "Configuring $IFACE with $AP_IP/24..."
ip addr flush dev "$IFACE" 2>/dev/null || true
ip link set "$IFACE" down 2>/dev/null || true
sleep 1
ip addr add "${AP_IP}/24" dev "$IFACE"
ip link set "$IFACE" up

# ---------------------------------------------------------------------------
# Start hostapd
# ---------------------------------------------------------------------------
info "Starting hostapd (channel $CHANNEL, 80 MHz, beamforming enabled)..."
hostapd "$HOSTAPD_CONF" -B -P /tmp/hostapd-test.pid -f /tmp/hostapd-test.log

info "Waiting for hostapd initialization (HT scan, up to 60s)..."
for i in $(seq 1 60); do
	if hostapd_cli -i "$IFACE" status &>/dev/null; then
		break
	fi
	if ! kill -0 "$(cat /tmp/hostapd-test.pid 2>/dev/null)" 2>/dev/null; then
		log "hostapd log:"
		tail -20 /tmp/hostapd-test.log >>"$LOGFILE" 2>/dev/null || true
		die "hostapd process died during initialization"
	fi
	if ((i % 10 == 0)); then
		echo "  ... waiting ($i/60s)"
	fi
	sleep 1
done

if ! hostapd_cli -i "$IFACE" status &>/dev/null; then
	log "hostapd log:"
	tail -20 /tmp/hostapd-test.log >>"$LOGFILE" 2>/dev/null || true
	die "hostapd failed to initialize after 60 seconds"
fi

HOSTAPD_PID="$(cat /tmp/hostapd-test.pid 2>/dev/null || pidof hostapd || true)"
ok "hostapd running (PID: $HOSTAPD_PID)"

# Show AP state summary on terminal
hostapd_cli -i "$IFACE" status 2>/dev/null | grep -E "^(state|freq|channel)" || true

# ---------------------------------------------------------------------------
# Start dnsmasq (DHCP only, no DNS to avoid port 53 conflict)
# ---------------------------------------------------------------------------
info "Starting dnsmasq (DHCP only)..."
dnsmasq \
	--interface="$IFACE" \
	--bind-interfaces \
	--dhcp-range="${DHCP_START},${DHCP_END},12h" \
	--port=0 \
	--pid-file=/tmp/dnsmasq-test.pid \
	--log-dhcp

DNSMASQ_PID="$(cat /tmp/dnsmasq-test.pid 2>/dev/null || true)"
ok "dnsmasq running (PID: $DNSMASQ_PID)"

# ---------------------------------------------------------------------------
# Wait for client
# ---------------------------------------------------------------------------
echo ""
info "AP is ready: SSID='$SSID', password='$PASSPHRASE'"
info "Waiting for a client to connect (timeout: ${CLIENT_TIMEOUT}s)..."
echo ""

client_mac=""
for i in $(seq 1 "$CLIENT_TIMEOUT"); do
	station_out="$(iw dev "$IFACE" station dump 2>/dev/null || true)"
	if [[ -n "$station_out" ]]; then
		client_mac="$(echo "$station_out" | grep -oP 'Station \K[0-9a-f:]+' | head -1)"
		if [[ -n "$client_mac" ]]; then
			break
		fi
	fi
	if ((i % 10 == 0)); then
		echo "  ... waiting ($i/${CLIENT_TIMEOUT}s)"
	fi
	sleep 1
done

if [[ -z "$client_mac" ]]; then
	die "No client connected within ${CLIENT_TIMEOUT} seconds"
fi

ok "Client connected: $client_mac"

info "Waiting 15s for DHCP lease and link stabilization..."
sleep 15

# ---------------------------------------------------------------------------
# Discover client IP from ARP/neighbor table
# ---------------------------------------------------------------------------
client_ip=""
client_ip="$(ip neigh show dev "$IFACE" | grep -i "$client_mac" | awk '{print $1}' | head -1 || true)"

if [[ -z "$client_ip" ]]; then
	for last_octet in $(seq 100 200); do
		test_ip="10.0.0.${last_octet}"
		if ping -c1 -W1 "$test_ip" &>/dev/null; then
			client_ip="$test_ip"
			break
		fi
	done
fi

if [[ -z "$client_ip" ]]; then
	warn "Could not discover client IP automatically"
	echo -n "Enter client IP: "
	read -r client_ip
fi

ok "Client IP: $client_ip"

# ---------------------------------------------------------------------------
# Verify iperf3 server is reachable
# ---------------------------------------------------------------------------
info "Checking iperf3 server on $client_ip..."
for i in $(seq 1 12); do
	if iperf3 -c "$client_ip" -t 1 -P1 &>/dev/null; then
		break
	fi
	if ((i == 12)); then
		warn "iperf3 server not responding on $client_ip:5201"
		echo "Start iperf3 on the client: iperf3 -s"
		echo -n "Press Enter when ready (or Ctrl+C to abort)..."
		read -r
	fi
	sleep 5
done

# ---------------------------------------------------------------------------
# Resolve PHY name (used by multiple sections)
# ---------------------------------------------------------------------------
phy="$(iw dev "$IFACE" info | grep wiphy | awk '{print "phy"$2}')"
debugfs="/sys/kernel/debug/ieee80211/${phy}"

# =========================================================================
#  DIAGNOSTICS (logged only, summary printed at end)
# =========================================================================

# --- Station capabilities ---
log_section "STATION CAPABILITIES"
iw dev "$IFACE" station dump >>"$LOGFILE" 2>/dev/null || true

# --- hostapd negotiated capabilities ---
log_section "HOSTAPD NEGOTIATED CAPABILITIES"
hostapd_cli -i "$IFACE" status >>"$LOGFILE" 2>/dev/null || true

# --- PHY beamforming ---
log_section "PHY INFO (beamforming support)"
if [[ -n "$phy" ]]; then
	echo "--- VHT Capabilities ---" >>"$LOGFILE"
	iw phy "$phy" info | sed -n '/VHT Capabilities/,/^[[:space:]]*$/p' >>"$LOGFILE" 2>/dev/null || true

	echo "" >>"$LOGFILE"
	echo "--- HE (802.11ax) Beamforming ---" >>"$LOGFILE"
	iw phy "$phy" info | grep -A5 -i "beamform" >>"$LOGFILE" 2>/dev/null || log "  (no beamforming lines found)"
fi

# --- TX power ---
log_section "TX POWER"
iw dev "$IFACE" info | grep txpower >>"$LOGFILE" 2>/dev/null || log "  (not available)"

# --- Channel survey ---
log_section "CHANNEL SURVEY"
iw dev "$IFACE" survey dump >>"$LOGFILE" 2>/dev/null || log "  (not available)"

# --- mt76 debugfs ---
log_section "MT76 DRIVER INTERNALS (debugfs)"

log "--- AMPDU aggregation status ---"
agg_path="$(find "$debugfs" -path "*/stations/*/agg_status" 2>/dev/null | head -1)"
if [[ -n "$agg_path" ]] && [[ -r "$agg_path" ]]; then
	cat "$agg_path" >>"$LOGFILE"
else
	log "  (agg_status not available)"
fi

log ""
log "--- TX rate stats (pre-benchmark) ---"
if [[ -r "${debugfs}/mt76/tx_stats" ]]; then
	cat "${debugfs}/mt76/tx_stats" >>"$LOGFILE"
else
	log "  (tx_stats not available)"
fi

log ""
log "--- AMPDU stats ---"
if [[ -r "${debugfs}/mt76/ampdu_stat" ]]; then
	cat "${debugfs}/mt76/ampdu_stat" >>"$LOGFILE"
else
	log "  (ampdu_stat not available)"
fi

log ""
log "--- Queue depths ---"
if [[ -r "${debugfs}/mt76/queues" ]]; then
	cat "${debugfs}/mt76/queues" >>"$LOGFILE"
else
	log "  (queues not available)"
fi

log ""
log "--- Per-station airtime ---"
airtime_path="$(find "$debugfs" -path "*/stations/*/airtime" 2>/dev/null | head -1)"
if [[ -n "$airtime_path" ]] && [[ -r "$airtime_path" ]]; then
	cat "$airtime_path" >>"$LOGFILE"
else
	log "  (airtime not available)"
fi

# Print beamforming summary to terminal
info "Diagnostics logged. Checking beamforming negotiation..."
vht_caps="$(hostapd_cli -i "$IFACE" status 2>/dev/null | grep vht_caps_info | cut -d= -f2 || true)"
if [[ -n "$vht_caps" ]]; then
	# Bit 11: SU Beamformer, Bit 12: SU Beamformee, Bit 19: MU Beamformer
	caps_int=$((16#${vht_caps}))
	bf_status=""
	if ((caps_int & 0x800)); then bf_status+="SU-BFer "; fi
	if ((caps_int & 0x1000)); then bf_status+="SU-BFee "; fi
	if ((caps_int & 0x80000)); then bf_status+="MU-BFer "; fi
	if ((caps_int & 0x100000)); then bf_status+="MU-BFee "; fi
	if [[ -z "$bf_status" ]]; then
		warn "Beamforming NOT negotiated (vht_caps_info=$vht_caps)"
	else
		ok "Beamforming active: $bf_status(vht_caps_info=$vht_caps)"
	fi
else
	warn "Could not read VHT caps from hostapd"
fi

txpower="$(iw dev "$IFACE" info 2>/dev/null | grep -oP 'txpower \K[0-9.]+' || true)"
if [[ -n "$txpower" ]]; then
	info "TX power: $txpower dBm"
else
	info "TX power: unknown"
fi

# =========================================================================
#  WARM-UP (discarded, drives rate control to converge)
# =========================================================================
#
# Without warm-up, the first iperf3 benchmark includes the ramp-up period
# where firmware rate control is still converging from a cold association.
# On today's tests we saw MCS climbing from initial values over the first
# few seconds of traffic. This warm-up pushes steady load for 20s so the
# real benchmarks start from a stable operating point.

echo ""
info "Running 20s warm-up traffic to converge rate control..."
log_section "WARM-UP (discarded)"
log "Link state BEFORE warm-up:"
iw dev "$IFACE" station dump >>"$LOGFILE" 2>/dev/null || true
log ""
run_quiet iperf3 -c "$client_ip" -B "$AP_IP" -P"$IPERF_STREAMS" -t 20 || true
log ""
log "Link state AFTER warm-up:"
iw dev "$IFACE" station dump >>"$LOGFILE" 2>/dev/null || true
rate_after_warmup=$(iw dev "$IFACE" station dump 2>/dev/null | awk '/tx bitrate:/{print $3, $4, $5, $6}' | head -1)
ok "Warm-up complete (tx rate: ${rate_after_warmup:-unknown})"
sleep 3

# =========================================================================
#  BENCHMARKS (shown on terminal and logged)
# =========================================================================

# --- Downstream ---
echo ""
info "Running downstream benchmark (AP -> Client)..."
log_section "THROUGHPUT: DOWNSTREAM (AP -> Client)"
log "  Streams: $IPERF_STREAMS | Duration: ${IPERF_DURATION}s | Target: $client_ip"
run_logged iperf3 -c "$client_ip" -B "$AP_IP" -P"$IPERF_STREAMS" -t "$IPERF_DURATION" || true

# --- Upstream ---
echo ""
info "Running upstream benchmark (Client -> AP)..."
log_section "THROUGHPUT: UPSTREAM (Client -> AP)"
run_logged iperf3 -c "$client_ip" -B "$AP_IP" -P"$IPERF_STREAMS" -t "$IPERF_DURATION" -R || true

# --- Bidirectional ---
echo ""
info "Running bidirectional benchmark..."
log_section "THROUGHPUT: BIDIRECTIONAL"
run_logged iperf3 -c "$client_ip" -B "$AP_IP" -P"$IPERF_STREAMS" -t "$IPERF_DURATION" --bidir || true

# =========================================================================
#  POST-BENCHMARK
# =========================================================================

log_section "POST-BENCHMARK STATION INFO"
iw dev "$IFACE" station dump >>"$LOGFILE" 2>/dev/null || true

log_section "POST-BENCHMARK TX RATE STATS"
if [[ -r "${debugfs}/mt76/tx_stats" ]]; then
	cat "${debugfs}/mt76/tx_stats" >>"$LOGFILE"
fi

# --- Terminal summary ---
echo ""
echo "================================================================"
echo "  SUMMARY"
echo "================================================================"

# Extract SUM lines from log for quick view
echo "Downstream (AP -> Client):"
grep "^\[SUM\].*sender" "$LOGFILE" | head -1 || echo "  (no data)"
echo ""
echo "Upstream (Client -> AP):"
grep "^\[SUM\].*sender" "$LOGFILE" | sed -n '2p' || echo "  (no data)"
echo ""
echo "Bidirectional:"
grep "^\[SUM\]\[TX-C\].*sender" "$LOGFILE" | head -1 || echo "  TX: (no data)"
grep "^\[SUM\]\[RX-C\].*sender" "$LOGFILE" | head -1 || echo "  RX: (no data)"
echo ""

# Post-benchmark station key metrics
echo "Post-benchmark station:"
iw dev "$IFACE" station dump 2>/dev/null | grep -E "(tx bitrate|rx bitrate|tx retries|tx failed)" || true
echo ""

ok "AP mode test finished. Cleaning up..."
