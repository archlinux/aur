#!/usr/bin/env bash
# Quick validation script for mediatek-mt7927-dkms.
# Runs in <30 seconds. Non-destructive - does not change config.
# Paste the output block into GitHub issues for structured reporting.
#
# Usage:
#   ./test-driver.sh            # auto-detect interface
#   ./test-driver.sh wlp9s0     # specify interface

set -euo pipefail

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
ok() { echo "OK${1:+ ($1)}"; }
fail() { echo "FAIL${1:+ ($1)}"; }
skip() { echo "SKIP${1:+ ($1)}"; }
na() { echo "N/A${1:+ ($1)}"; }

# grep wrapper: avoids SIGPIPE with pipefail by not using -q
has_match() { grep "$@" >/dev/null 2>&1; }

join_parts() {
	local IFS=','
	local joined="${*}"
	# Insert space after each comma
	echo "${joined//,/, }"
}

# ---------------------------------------------------------------------------
# 1. Package version
# ---------------------------------------------------------------------------
get_package_version() {
	if command -v pacman &>/dev/null; then
		pacman -Q mediatek-mt7927-dkms 2>/dev/null | awk '{print $2}' || echo "not installed"
	else
		echo "unknown (no pacman)"
	fi
}

# ---------------------------------------------------------------------------
# 2. Kernel version
# ---------------------------------------------------------------------------
get_kernel_version() {
	uname -r
}

# ---------------------------------------------------------------------------
# 3. PCI ID
# ---------------------------------------------------------------------------
get_pci_id() {
	local id=""
	for dev in /sys/bus/pci/drivers/mt7925e/*/vendor; do
		if [[ -f "$dev" ]]; then
			local dir
			dir="$(dirname "$dev")"
			local vendor device
			vendor="$(cat "$dir/vendor" 2>/dev/null | sed 's/^0x//')"
			device="$(cat "$dir/device" 2>/dev/null | sed 's/^0x//')"
			id="${vendor}:${device}"
			break
		fi
	done
	echo "${id:-not found}"
}

# ---------------------------------------------------------------------------
# 4. Module loading
# ---------------------------------------------------------------------------
check_modules() {
	local expected=(mt7925e mt7925_common mt76 mt76_connac_lib mt792x_lib btusb btmtk)
	local loaded=()
	local missing=()

	local lsmod_out
	lsmod_out="$(lsmod)"

	for mod in "${expected[@]}"; do
		if echo "$lsmod_out" | has_match -w "$mod"; then
			loaded+=("$mod")
		else
			missing+=("$mod")
		fi
	done

	if ((${#missing[@]} == 0)); then
		ok "$(join_parts "${loaded[@]}")"
	else
		fail "missing: $(join_parts "${missing[@]}")"
	fi
}

# ---------------------------------------------------------------------------
# 5. DKMS build status
# ---------------------------------------------------------------------------
check_dkms() {
	if ! command -v dkms &>/dev/null; then
		skip "dkms not found"
		return
	fi

	local status
	status="$(dkms status mediatek-mt7927 2>/dev/null)" || true

	if [[ -z "$status" ]]; then
		fail "not in DKMS tree"
		return
	fi

	# Check for "installed" status for current kernel
	local current_kernel
	current_kernel="$(uname -r)"
	if echo "$status" | has_match "${current_kernel}.*installed"; then
		local ver
		ver="$(echo "$status" | grep -oP 'mediatek-mt7927[,/]\s*\K[0-9.]+' | head -1 || true)"
		ok "${ver:+v${ver}, }installed"
	elif echo "$status" | has_match "installed"; then
		fail "installed for different kernel (not ${current_kernel})"
	else
		fail "$(echo "$status" | head -1)"
	fi
}

# ---------------------------------------------------------------------------
# 6. Module source (DKMS vs built-in)
# ---------------------------------------------------------------------------
check_module_source() {
	local mods=(mt7925e btusb)
	local all_dkms=true

	for mod in "${mods[@]}"; do
		local mod_path
		mod_path="$(modinfo -n "$mod" 2>/dev/null)" || true

		if [[ -z "$mod_path" ]]; then
			continue
		fi

		if ! echo "$mod_path" | has_match "updates/dkms"; then
			if echo "$mod_path" | has_match "kernel/"; then
				fail "$mod is built-in (DKMS module not loaded)"
				return
			fi
			all_dkms=false
		fi
	done

	if $all_dkms; then
		ok "DKMS"
	else
		ok "mixed"
	fi
}

# ---------------------------------------------------------------------------
# 7. Firmware loading from dmesg
# ---------------------------------------------------------------------------
check_firmware() {
	local dmesg_out=""
	dmesg_out="$(dmesg 2>/dev/null || true)"

	if [[ -z "$dmesg_out" ]]; then
		skip "dmesg not accessible (try with sudo)"
		return
	fi

	local mt_dmesg
	mt_dmesg="$(echo "$dmesg_out" | grep -E 'mt7925e|MT7927|MT6639' || true)"

	local hw_ver=""
	local wm_ver=""

	hw_ver="$(echo "$mt_dmesg" | grep -oP 'HW/SW Version:\s*\K[^,]+' | tail -1 || true)"
	wm_ver="$(echo "$mt_dmesg" | grep -oP 'WM Firmware Version:\s*\K[^,]+' | tail -1 || true)"

	if [[ -z "$hw_ver" && -z "$wm_ver" ]]; then
		fail "no firmware version in dmesg"
		return
	fi

	# Check for CBTOP remap failure (all-zeros HW version)
	if [[ "$hw_ver" == "0x00000000" ]]; then
		fail "CBTOP remap failed (HW version 0x00000000)"
		return
	fi

	ok "HW ${hw_ver:-?}, WM ${wm_ver:-?}"
}

# ---------------------------------------------------------------------------
# 8. ASPM status (MT7927 needs ASPM disabled)
# ---------------------------------------------------------------------------
check_aspm() {
	local dmesg_out=""
	dmesg_out="$(dmesg 2>/dev/null || true)"

	if [[ -z "$dmesg_out" ]]; then
		skip "dmesg not accessible"
		return
	fi

	# Check if ASPM disabled globally via kernel cmdline
	if grep -qE '(pcie_aspm=off|pcie_aspm\.policy=performance)' /proc/cmdline 2>/dev/null; then
		ok "disabled via kernel cmdline"
		return
	fi

	# Check if the driver disabled ASPM at probe
	if echo "$dmesg_out" | has_match 'mt7925e.*disabling ASPM'; then
		ok "disabled by driver"
		return
	fi

	# Check if disabled via module parameter
	if echo "$dmesg_out" | has_match 'mt7925e.disable_aspm=1'; then
		ok "disabled via module param"
		return
	fi

	# If MT7927 but no ASPM disable message, warn
	local mt_dmesg
	mt_dmesg="$(echo "$dmesg_out" | grep -E 'mt7925e.*MT7927' || true)"
	if [[ -n "$mt_dmesg" ]]; then
		fail "L1 not disabled (throughput collapse risk, upgrade package)"
	else
		na "not MT7927 or no dmesg data"
	fi
}

# ---------------------------------------------------------------------------
# 9. Bluetooth USB device presence
# ---------------------------------------------------------------------------
check_bt_usb() {
	# Known MT6639 BT USB vendor:product pairs
	local bt_ids=("0489:e13a" "0489:e0fa" "0489:e10f" "0489:e110" "0489:e116" "13d3:3588" "0e8d:6639")
	local lsusb_out
	lsusb_out="$(lsusb 2>/dev/null || true)"

	if [[ -z "$lsusb_out" ]]; then
		skip "lsusb not available"
		return
	fi

	for id in "${bt_ids[@]}"; do
		if echo "$lsusb_out" | has_match -i "$id"; then
			ok "$id"
			return
		fi
	done

	na "no MT6639 BT USB device found"
}

# ---------------------------------------------------------------------------
# 10. Bluetooth firmware loading from dmesg
# ---------------------------------------------------------------------------
check_bt_firmware() {
	local dmesg_out=""
	dmesg_out="$(dmesg 2>/dev/null || true)"

	if [[ -z "$dmesg_out" ]]; then
		skip "dmesg not accessible"
		return
	fi

	local bt_dmesg
	bt_dmesg="$(echo "$dmesg_out" | grep -iE 'btmtk|btusb|mt6639|mt7927.*bluetooth|BT_RAM_CODE|hci[0-9].*MT' || true)"

	if [[ -z "$bt_dmesg" ]]; then
		na "no btmtk/btusb messages in dmesg"
		return
	fi

	# Check for firmware load errors
	if echo "$bt_dmesg" | has_match 'firmware.*error\|failed.*error\|Direct firmware load.*failed'; then
		local fw_err
		fw_err="$(echo "$bt_dmesg" | grep -i 'error' | tail -1)"
		local errno
		errno="$(echo "$fw_err" | grep -oP 'error -?\K[0-9]+' || true)"
		case "$errno" in
		2) fail "firmware not found (ENOENT - check firmware path)" ;;
		22) fail "firmware invalid (EINVAL - check file integrity)" ;;
		110) fail "firmware timeout (ETIMEDOUT - USB communication)" ;;
		*) fail "firmware load error: $fw_err" ;;
		esac
		return
	fi

	# Check for successful HCI registration (MT6639-specific)
	if echo "$bt_dmesg" | has_match 'hci[0-9].*Device setup\|hci[0-9].*AOSP extensions'; then
		ok "loaded"
	elif echo "$bt_dmesg" | has_match 'hci[0-9]'; then
		ok "loaded"
	else
		na "no HCI device registered"
	fi
}

# ---------------------------------------------------------------------------
# 11. Bluetooth rfkill status
# ---------------------------------------------------------------------------
check_bt_rfkill() {
	if ! command -v rfkill &>/dev/null; then
		skip "rfkill not found"
		return
	fi

	local bt_rfkill
	bt_rfkill="$(rfkill -n -o TYPE,SOFT list bluetooth 2>/dev/null || true)"

	if [[ -z "$bt_rfkill" ]]; then
		na "no bluetooth device"
		return
	fi

	if echo "$bt_rfkill" | has_match " blocked"; then
		fail "soft-blocked (run: rfkill unblock bluetooth)"
	else
		ok "unblocked"
	fi
}

# ---------------------------------------------------------------------------
# 12. Interface detection (auto via sysfs)
# ---------------------------------------------------------------------------
detect_interface() {
	local iface=""

	# Method 1: sysfs driver binding
	for dev_path in /sys/bus/pci/drivers/mt7925e/*/net/*; do
		if [[ -d "$dev_path" ]]; then
			iface="$(basename "$dev_path")"
			break
		fi
	done

	# Method 2: fallback via /sys/class/net
	if [[ -z "$iface" ]]; then
		for net in /sys/class/net/*; do
			local driver_link="${net}/device/driver"
			if [[ -L "$driver_link" ]]; then
				local driver_name
				driver_name="$(basename "$(readlink "$driver_link")")"
				if [[ "$driver_name" == "mt7925e" ]]; then
					iface="$(basename "$net")"
					break
				fi
			fi
		done
	fi

	echo "$iface"
}

# ---------------------------------------------------------------------------
# 13. EHT / 320MHz / MLO capability
# ---------------------------------------------------------------------------
check_eht_caps() {
	local iface="$1"

	if [[ -z "$iface" ]]; then
		skip "no interface"
		return
	fi

	local phy
	phy="$(iw dev "$iface" info 2>/dev/null | grep -oP 'wiphy \K[0-9]+' || true)"

	if [[ -z "$phy" ]]; then
		skip "cannot determine phy"
		return
	fi

	local phy_info
	phy_info="$(iw phy "phy${phy}" info 2>/dev/null || true)"

	if [[ -z "$phy_info" ]]; then
		skip "cannot read phy info"
		return
	fi

	local parts=()

	if echo "$phy_info" | has_match 'EHT'; then
		parts+=("EHT")
	fi

	# 320MHz support in EHT capabilities
	if echo "$phy_info" | has_match '320MHz\|320 MHz'; then
		parts+=("320MHz")
	fi

	# Check supported bands
	local bands=()
	if echo "$phy_info" | has_match 'Band 1:'; then
		bands+=("2.4G")
	fi
	if echo "$phy_info" | has_match 'Band 2:'; then
		bands+=("5G")
	fi
	if echo "$phy_info" | has_match 'Band 4:'; then
		bands+=("6G")
	fi
	if ((${#bands[@]} > 0)); then
		parts+=("$(join_parts "${bands[@]}")")
	fi

	if ((${#parts[@]} > 0)); then
		ok "$(join_parts "${parts[@]}")"
	else
		fail "no EHT capability (WiFi 7 not advertised)"
	fi
}

# ---------------------------------------------------------------------------
# 14. Device readiness (nmcli)
# ---------------------------------------------------------------------------
check_device_ready() {
	local iface="$1"

	if [[ -z "$iface" ]]; then
		skip "no interface"
		return
	fi

	if ! command -v nmcli &>/dev/null; then
		skip "nmcli not available"
		return
	fi

	local state
	state="$(nmcli -g GENERAL.STATE device show "$iface" 2>/dev/null || true)"

	if [[ -z "$state" ]]; then
		fail "device not found in NetworkManager"
		return
	fi

	case "$state" in
	*"unavailable"*)
		fail "unavailable (firmware may not have initialized)"
		;;
	*"unmanaged"*)
		na "unmanaged by NetworkManager"
		;;
	*"disconnected"*)
		ok "ready (disconnected)"
		;;
	*"connected"*)
		ok "connected"
		;;
	*)
		ok "$state"
		;;
	esac
}

# ---------------------------------------------------------------------------
# 15. Regulatory / 6GHz NO_IR status
# ---------------------------------------------------------------------------
check_regulatory() {
	local iface="$1"

	if [[ -z "$iface" ]]; then
		skip "no interface"
		return
	fi

	local phy
	phy="$(iw dev "$iface" info 2>/dev/null | grep -oP 'wiphy \K[0-9]+' || true)"

	if [[ -z "$phy" ]]; then
		skip "cannot determine phy"
		return
	fi

	local reg_out
	reg_out="$(iw phy "phy${phy}" reg get 2>/dev/null || true)"

	if [[ -z "$reg_out" ]]; then
		skip "cannot read regulatory"
		return
	fi

	local country
	country="$(echo "$reg_out" | grep -oP 'country \K[A-Z]{2}' | head -1 || true)"

	# Count 6GHz channels (5925+) with and without NO_IR
	local total_6g=0 no_ir_6g=0
	while IFS= read -r line; do
		if echo "$line" | has_match -P '\(59[2-9][0-9]|[6-7][0-9]{3}\s'; then
			total_6g=$((total_6g + 1))
			if echo "$line" | has_match 'NO-IR'; then
				no_ir_6g=$((no_ir_6g + 1))
			fi
		fi
	done <<<"$reg_out"

	local cleared_6g=$((total_6g - no_ir_6g))

	if ((total_6g == 0)); then
		ok "country ${country:-??}, no 6GHz rules"
	elif ((no_ir_6g == 0)); then
		ok "country ${country:-??}, 6GHz: all ${total_6g} channels cleared"
	elif ((cleared_6g > 0)); then
		ok "country ${country:-??}, 6GHz: ${cleared_6g}/${total_6g} cleared, ${no_ir_6g} NO_IR"
	else
		na "country ${country:-??}, 6GHz: all ${total_6g} channels NO_IR (need AP with country IE)"
	fi
}

# ---------------------------------------------------------------------------
# 16. WiFi scan - report available bands
# ---------------------------------------------------------------------------
check_scan() {
	local iface="$1"

	if [[ -z "$iface" ]]; then
		skip "no interface"
		return
	fi

	local scan_out=""
	scan_out="$(iw dev "$iface" scan 2>&1 || true)"

	if [[ -z "$scan_out" ]] || echo "$scan_out" | has_match "Operation not permitted\|command failed"; then
		skip "scan failed (interface down or driver busy)"
		return
	fi

	local count_2g=0 count_5g=0 count_6g=0
	local freqs
	freqs="$(echo "$scan_out" | grep -oP 'freq:\s*\K[0-9]+' || true)"

	while IFS= read -r freq; do
		[[ -z "$freq" ]] && continue
		if ((freq >= 2400 && freq <= 2500)); then
			count_2g=$((count_2g + 1))
		elif ((freq >= 5150 && freq <= 5900)); then
			count_5g=$((count_5g + 1))
		elif ((freq >= 5925)); then
			count_6g=$((count_6g + 1))
		fi
	done <<<"$freqs"

	local total=$((count_2g + count_5g + count_6g))
	if ((total > 0)); then
		ok "2.4 GHz: ${count_2g}, 5 GHz: ${count_5g}, 6 GHz: ${count_6g}"
	else
		fail "no APs found"
	fi
}

# ---------------------------------------------------------------------------
# 17. Connection status
# ---------------------------------------------------------------------------
check_connection() {
	local iface="$1"

	if [[ -z "$iface" ]]; then
		skip "no interface"
		return
	fi

	local link_out
	link_out="$(iw dev "$iface" link 2>/dev/null)" || true

	if echo "$link_out" | has_match "Not connected"; then
		na "not connected"
		return
	fi

	local ssid freq signal tx_bitrate
	ssid="$(echo "$link_out" | grep -oP 'SSID:\s*\K.*' || true)"
	freq="$(echo "$link_out" | grep -oP 'freq:\s*\K[0-9]+' || true)"
	signal="$(echo "$link_out" | grep -oP 'signal:\s*\K-?[0-9]+' || true)"
	tx_bitrate="$(echo "$link_out" | grep -oP 'tx bitrate:\s*\K[0-9.]+\s*\S+' || true)"

	# Channel width from iw dev info (shows 20/40/80/160/320 MHz)
	local width=""
	width="$(iw dev "$iface" info 2>/dev/null | grep -oP 'width:\s*\K[0-9]+' || true)"

	# Get auth type: try nmcli first (works with NM), fall back to wpa_cli
	local auth=""
	if command -v nmcli &>/dev/null; then
		local active_uuid
		active_uuid="$(nmcli -t -f UUID,TYPE connection show --active 2>/dev/null |
			grep '802-11-wireless' | head -1 | cut -d: -f1 || true)"
		if [[ -n "$active_uuid" ]]; then
			auth="$(nmcli -g 802-11-wireless-security.key-mgmt connection show "$active_uuid" 2>/dev/null || true)"
		fi
	fi
	if [[ -z "$auth" ]]; then
		auth="$(wpa_cli -i "$iface" status 2>/dev/null | grep -oP 'key_mgmt=\K.*' || true)"
	fi

	local parts=()
	[[ -n "$ssid" ]] && parts+=("$ssid")
	[[ -n "$freq" ]] && parts+=("${freq} MHz")
	[[ -n "$width" ]] && parts+=("${width} MHz width")
	[[ -n "$auth" ]] && parts+=("$auth")
	[[ -n "$signal" ]] && parts+=("${signal} dBm")
	[[ -n "$tx_bitrate" ]] && parts+=("TX ${tx_bitrate}")

	if ((${#parts[@]} > 0)); then
		ok "$(join_parts "${parts[@]}")"
	else
		ok ""
	fi
}

# ---------------------------------------------------------------------------
# 18. Quick data path test (3 pings to gateway)
# ---------------------------------------------------------------------------
check_data_path() {
	local iface="$1"

	if [[ -z "$iface" ]]; then
		skip "no interface"
		return
	fi

	# Check if connected first
	local link_out
	link_out="$(iw dev "$iface" link 2>/dev/null)" || true
	if echo "$link_out" | has_match "Not connected"; then
		skip "not connected"
		return
	fi

	# Find gateway
	local gw=""
	gw="$(ip route show default dev "$iface" 2>/dev/null |
		grep -oP 'via \K[0-9.]+' | head -1 || true)"
	if [[ -z "$gw" ]]; then
		gw="$(ip route show default 2>/dev/null |
			grep -oP 'via \K[0-9.]+' | head -1 || true)"
	fi

	local target="${gw:-1.1.1.1}"

	local ping_out
	ping_out="$(ping -c 3 -W 3 -I "$iface" "$target" 2>&1)" || true

	local received
	received="$(echo "$ping_out" | grep -oP '[0-9]+(?= received)' || echo "0")"
	local avg
	avg="$(echo "$ping_out" | grep -oP 'rtt min/avg/max/mdev = [0-9.]+/\K[0-9.]+' || true)"

	if ((received > 0)); then
		ok "${received}/3 pings to ${target}${avg:+, avg ${avg}ms}"
	elif [[ "$target" != "1.1.1.1" ]]; then
		# Gateway may block ICMP, try public DNS
		ping_out="$(ping -c 3 -W 3 -I "$iface" 1.1.1.1 2>&1)" || true
		received="$(echo "$ping_out" | grep -oP '[0-9]+(?= received)' || echo "0")"
		avg="$(echo "$ping_out" | grep -oP 'rtt min/avg/max/mdev = [0-9.]+/\K[0-9.]+' || true)"
		if ((received > 0)); then
			ok "${received}/3 pings to 1.1.1.1${avg:+, avg ${avg}ms}"
		else
			fail "0/3 pings to ${target} and 1.1.1.1"
		fi
	else
		fail "0/3 pings to 1.1.1.1"
	fi
}

# ---------------------------------------------------------------------------
# 19. Error pattern check in dmesg
# ---------------------------------------------------------------------------
check_errors() {
	local dmesg_out=""
	dmesg_out="$(dmesg 2>/dev/null || true)"

	if [[ -z "$dmesg_out" ]]; then
		skip "dmesg not accessible"
		return
	fi

	local mt_dmesg
	mt_dmesg="$(echo "$dmesg_out" | grep -iE 'mt76|mt7925|mt7927|mt6639|mt792x' || true)"

	if [[ -z "$mt_dmesg" ]]; then
		fail "no mt76 messages in dmesg (driver not loaded?)"
		return
	fi

	# Critical: STA insertion failure (firmware state corruption)
	if echo "$mt_dmesg" | has_match -i 'failed to insert STA entry'; then
		local sta_err
		sta_err="$(echo "$mt_dmesg" | grep -i 'failed to insert STA entry' | tail -1)"
		fail "STA insertion failure (firmware corrupted, reboot required)"
		echo "    $sta_err"
		return
	fi

	# Critical: 4WAY_HANDSHAKE_TIMEOUT (band_idx bug)
	if echo "$mt_dmesg" | has_match -i 'reason=15'; then
		local reason_err
		reason_err="$(echo "$mt_dmesg" | grep -i 'reason=15' | tail -1)"
		fail "4WAY_HANDSHAKE_TIMEOUT (upgrade to latest package)"
		echo "    $reason_err"
		return
	fi

	# Look for other error patterns (exclude known benign messages)
	local errors=""
	errors="$(echo "$mt_dmesg" | grep -iE 'error|timeout|reset|fail' |
		grep -ivE 'ASPM|disabling|taint' || true)"

	if [[ -z "$errors" ]]; then
		echo "NONE"
	else
		local count
		count="$(echo "$errors" | wc -l)"
		echo "FAIL (${count} error(s) found)"
		echo "$errors" | tail -5 | while IFS= read -r line; do
			echo "    $line"
		done
	fi
}

# ---------------------------------------------------------------------------
# Module reload (ensures we test installed DKMS build, not boot-time modules)
# ---------------------------------------------------------------------------
reload_modules() {
	local wifi_mods=(mt7925e mt7921e mt7925_common mt7921_common mt792x_lib mt76_connac_lib mt76)
	local bt_mods=(btusb btmtk)

	# Kill hostapd/wpa_supplicant to avoid crash from stale interface state
	if pidof hostapd &>/dev/null; then
		echo "  Stopping hostapd..."
		killall hostapd 2>/dev/null || true
		sleep 1
	fi

	echo "Reloading modules..."
	modprobe -r "${wifi_mods[@]}" 2>/dev/null || true
	modprobe -r "${bt_mods[@]}" 2>/dev/null || true

	modprobe mt7925e 2>/dev/null || true
	modprobe mt7921e 2>/dev/null || true
	modprobe btusb 2>/dev/null || true

	echo "Waiting for firmware init..."
	sleep 5

	# Wait for WiFi interface to appear (up to 10s)
	local iface="" waited=0
	while ((waited < 10)); do
		for dev_path in /sys/bus/pci/drivers/mt7925e/*/net/*; do
			if [[ -d "$dev_path" ]]; then
				iface="$(basename "$dev_path")"
				break 2
			fi
		done
		sleep 1
		waited=$((waited + 1))
	done

	if [[ -z "$iface" ]]; then
		echo "  WiFi interface not detected after ${waited}s"
		return
	fi

	echo "  WiFi interface: $iface"

	# Wait for NetworkManager to reconnect (up to 30s)
	echo "Waiting for network reconnection..."
	waited=0
	while ((waited < 30)); do
		if iw dev "$iface" link 2>/dev/null | grep -q "Connected"; then
			echo "  Connected after ${waited}s"
			return
		fi
		sleep 1
		waited=$((waited + 1))
	done
	echo "  Not reconnected after ${waited}s (scan/connection checks may skip)"
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
main() {
	if ((EUID != 0)); then
		echo "ERROR: this script must be run as root (sudo ./test-driver.sh)"
		exit 1
	fi

	local iface="${1:-}"

	# Reload WiFi and BT modules so we test the installed DKMS build,
	# not stale modules from boot time.
	reload_modules

	# Auto-detect interface if not specified
	if [[ -z "$iface" ]]; then
		iface="$(detect_interface)"
	fi

	echo ""
	echo "Running checks..."

	local pkg_ver kernel_ver pci_id
	local modules dkms_status mod_source firmware aspm_status
	local bt_usb bt_firmware bt_rfkill
	local eht_caps device_ready regulatory
	local scan_result conn_result data_result errors_result

	echo "  Package and kernel..."
	pkg_ver="$(get_package_version)"
	kernel_ver="$(get_kernel_version)"
	pci_id="$(get_pci_id)"

	echo "  Modules and DKMS..."
	modules="$(check_modules)"
	dkms_status="$(check_dkms)"
	mod_source="$(check_module_source)"

	echo "  WiFi firmware and ASPM..."
	firmware="$(check_firmware)"
	aspm_status="$(check_aspm)"

	echo "  Bluetooth..."
	bt_usb="$(check_bt_usb)"
	bt_firmware="$(check_bt_firmware)"
	bt_rfkill="$(check_bt_rfkill)"

	echo "  WiFi capabilities..."
	eht_caps="$(check_eht_caps "$iface")"
	device_ready="$(check_device_ready "$iface")"
	regulatory="$(check_regulatory "$iface")"

	echo "  Scan, connection, data path..."
	scan_result="$(check_scan "$iface")"
	conn_result="$(check_connection "$iface")"
	data_result="$(check_data_path "$iface")"

	echo "  Checking dmesg for errors..."
	errors_result="$(check_errors)"

	echo ""

	# Count failures from output (FAIL_COUNT doesn't propagate from subshells)
	local report
	report=$(
		cat <<EOF
## Driver Validation Report
- Package: mediatek-mt7927-dkms ${pkg_ver}
- Kernel: ${kernel_ver}
- PCI ID: ${pci_id}
- Modules: ${modules}
- DKMS: ${dkms_status}
- Module source: ${mod_source}
- Firmware: ${firmware}
- ASPM: ${aspm_status}
- BT USB: ${bt_usb}
- BT firmware: ${bt_firmware}
- BT rfkill: ${bt_rfkill}
- Interface: ${iface:-not found}
- EHT caps: ${eht_caps}
- Device ready: ${device_ready}
- Regulatory: ${regulatory}
- Scan: ${scan_result}
- Connection: ${conn_result}
- Data path: ${data_result}
- Errors: ${errors_result}
EOF
	)
	echo "$report"

	local fail_count
	fail_count=$(echo "$report" | grep -c 'FAIL' || true)

	if ((fail_count > 0)); then
		echo ""
		echo "RESULT: ${fail_count} check(s) failed"
		return 1
	else
		echo ""
		echo "RESULT: ALL CHECKS PASSED"
	fi
}

main "$@"
