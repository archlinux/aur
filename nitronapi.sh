#
# shellcheck disable=SC2148
# shellcheck disable=SC2034
# shellcheck disable=SC2117
# shellcheck disable=SC2148
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# shellcheck disable=SC2009
# shellcheck disable=SC2068
# shellcheck disable=SC2116
# shellcheck disable=SC2120
# shellcheck disable=SC2116
# shellcheck disable=SC2086
# shellcheck disable=SC1001
#
# nitronD API Manager.
#
# Copyright Identiter: GPL-3.0
# Copyright (C) 2022~2023 UsiFX <xprjkts@gmail.com>
#

export NITRON_HEADER_VERSION='2.7.1'

# cmdavail <command> ## if available > return 0 & log; else return 1 & log
cmdavail() {
	PR_PREFIX="cmdavail"
	if command -v "$1" >/dev/null; then
		printn -l "$1: available"
		return 0
	else
		printn -lf "$1: unavailable"
		return 1
	fi
}

trapper() { printn -e "shutdown signal recieved, closing..."; }

prompt_right() { echo -e "\r[${GREEN}$(echo "*")${STOCK}] ${@}";}

prompt_left() {
	case $* in
		"-t") echo -e "[  ${GREEN}$(echo " OK ")${STOCK}  ]" ;;
		"-f") echo -e "[  ${RED}$(echo "FAIL")${STOCK}  ]"
		      exit 1
		;;
		*) echo -e "[  ${PURPLE}$(echo "DONE")${STOCK}  ]" ;;
	esac
}

printcrnr() { compensate=13; printf "\r%*s\r%s\n" "$((COLUMNS+compensate))" "$1" "$(prompt_right "$2")" ; }

# usage: cmd & spin "text"
spin() {
	set +x
	PID=$!
	speed=0; anim='-\|/';
	while [ -d /proc/$PID ]; do
		sleep 0.09
		speed=$(((speed + 1) % 4))
		if [[ "PLATFORM" == "Android" ]]; then
			[[ "$BUSYBOX" == "true" ]] && busybox printf "\r[${anim:speed:1}] ${@}"
		else
			printf "\r[${anim:speed:1}] ${@}"
		fi
		[[ ! -d /proc/$PID ]] && printcrnr "$(prompt_left)" "${@}"
	done
}

## Variables
vars() {
# Resource variables
[[ -e "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor" ]] && cpu_gov=$(cat "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor") || printn -w "cannot grab CPU Governor, are we running on Container/CHRoot?"

# Number of CPU cores
nr_cores=$(awk -F "-" '{print $2}' "/sys/devices/system/cpu/possible")
nr_cores=$((nr_cores + 1))

# CPU Usage
cputotalusage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}' | cut -f1 -d\.$cputotalusage)

# Max CPU clock
cpu_max_freq=$(cat /sys/devices/system/cpu/cpu$(($(nproc) - 1 ))/cpufreq/cpuinfo_max_freq)
cpu_max_freq1=$(cat /sys/devices/system/cpu/cpu$(($(nproc) - 1 ))/cpufreq/scaling_max_freq)
[[ "$cpu_max_freq1" -gt "$cpu_max_freq" ]] && cpu_max_freq="$cpu_max_freq1"

# Min CPU clock
cpu_min_freq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq)
cpu_min_freq1=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq)
[[ "$cpu_min_freq1" -lt "$cpu_min_freq" ]] && cpu_min_freq="$cpu_min_freq1"

# HZ → MHz
cpu_min_clk_mhz=$((cpu_min_freq / 1000))
cpu_max_clk_mhz=$((cpu_max_freq / 1000))

# Battery info
# Current battery capacity available
[[ -e "/sys/class/power_supply/battery/capacity" ]] && batt_pctg=$(cat /sys/class/power_supply/battery/capacity) || cmdavail dumpsys && batt_pctg=$(dumpsys battery 2>/dev/null | awk '/level/{print $2}')

if [[ "$batt_pctg" != "" ]]; then
	# Battery health
	[[ -e "/sys/class/power_supply/battery/health" ]] && batt_hth=$(cat /sys/class/power_supply/battery/health) || cmdavail dumpsys && batt_hth=$(dumpsys battery | awk '/health/{print $2}')
	case "$batt_hth" in
		1) batt_hth="Unknown" ;;
		2) batt_hth="Good" ;;
		3) batt_hth="Overheat" ;;
		4) batt_hth="Dead" ;;
		5) batt_hth="OV" ;;
		6) batt_hth="UF" ;;
		7) batt_hth="Cold" ;;
	esac

	# Battery status
	[[ -e "/sys/class/power_supply/battery/status" ]] && batt_sts=$(cat /sys/class/power_supply/battery/status) || cmdavail dumpsys && batt_sts=$(dumpsys battery | awk '/status/{print $2}')
	case "$batt_sts" in
		1) batt_sts="Unknown" ;;
		2) batt_sts="Charging" ;;
		3) batt_sts="Discharging" ;;
		4) batt_sts="Not charging" ;;
		5) batt_sts="Full" ;;
	esac


	# Battery total capacity
	[[ -e "/sys/class/power_supply/battery/charge_full_design" ]] && batt_cpct=$(cat /sys/class/power_supply/battery/charge_full_design) || cmdavail dumpsys && batt_cpct=$(dumpsys batterystats | awk '/Capacity:/{print $2}' | cut -d "," -f 1)

	# MA → MAh
	[[ "$batt_cpct" -ge "1000000" ]] && batt_cpct=$((batt_cpct / 1000))
else
	if cmdavail upower; then
		batt_pctg=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage:"| awk '{print $2}' | cut -f1 -d\%)
		batt_cpct=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "capacity:"| awk '{print $2}' | cut -f1 -d\%)
		batt_sts=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state:"| awk '{print $2}')
		batt_hth=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "warning-level:"| awk '{print $2}')
	fi
fi

# Lowmemorykiller info
if [[ -d "/sys/module/lowmemorykiller" ]]; then
	lmkmodminfree=$(cat /sys/module/lowmemorykiller/parameters/minfree)
	case "$lmkmodminfree" in
		"6400,7680,11520,25600,35840,38400") lmksts="Aggressive" ;;
		"2560,5120,7680,8960,10240,12800")   lmksts="Light"  ;;
		"512,1024,1280,2048,3072,4096")      lmksts="Lighty" ;;
		"1024,2048,4096,8192,12288,16384")   lmksts="Medium" ;;
		"2560,5120,11520,25600,35840,38400") lmksts="Extreme" ;;
		*)				     lmksts="Default" ;;
	esac
else
    lmksts="Kernel Module not found."
fi
}

vars

## End of variables

# infogrbn <directory> <value>
infogrbn() { grep "$2" "$1" | awk '{ print $2 }';}

# infogrblongn <directory> <value>
infogrblongn() { grep "$2" "$1" | awk -F ": " '{ print $2,$3,$4,$5,$6,$7,$8,$9 }' | head -n1 && return $?;}

# setmoden <nitron mode>
setmoden() { echo "$1" > "$NITRON_LOG_DIR"/nitron.mode.lock ;}

modelockn()
{
	if [[ ! -f "$NITRON_LOG_DIR"/nitron.mode.lock ]]; then
		setmoden "UnInitialised"
	fi
	MODES=$(cat "$NITRON_LOG_DIR"/nitron.mode.lock)
	case "$MODES" in
		"Battery")
			setmoden "Battery"
		;;
		"Balanced")
			setmoden "Balanced"
		;;
		"Gaming")
			setmoden "Gaming"
		;;
		"Automatic")
			setmoden "Automatic"
		;;
		"Automatic green")
			setmoden "Automatic green"

		;;
		"Automatic yellow")
			setmoden "Automatic yellow"
		;;
		"Automatic red")
			setmoden "Automatic red"
		;;
	esac
}

oschk()
{
	PR_PREFIX="oschk"
	OSCHK=$(uname -o)

	case "$OSCHK" in
		"GNU/Linux")
			PLATFORM="GNU/Linux"
			if [[ -n "$WSL_DISTRO_NAME" ]]; then
					PLATFORM="GNU/Linux (WSL)"
					printn -e "Seems we are running under WSL environment, it's unusable at all with this tool."
			fi
			printn -l "OS: $PLATFORM"
			return 0
		;;
		"Linux")
			if grep -q "androidboot" /proc/cmdline; then
				cmdavail resetprop && PLATFORM="Android"
			else
				PLATFORM="Linux"
			fi
			printn -l "OS: $PLATFORM"
			return 0
		;;
		*)
			if grep -q "androidboot" /proc/cmdline; then
				PLATFORM="Android"
			else
				cmdavail resetprop && PLATFORM="Android" || { 
					PLATFORM="Unknown"
					printn -lf "OS: $PLATFORM"
					printn -e "Unknown Operating System, cannot start."
				}
			fi
		;;
	esac
}

apin() {
	# Installation type check
	instype()
	{
		if [[ "$(su --version)" == *"MAGISK"* ]]; then
			if [[ -d "/data/adb/modules/nitrond.magisk" ]]; then
				INSTALLATION="Magisk Module"
				cmdavail busybox && BUSYBOX=true || echo "BusyBox is required and it's not found on this system, cannot continue instance."
			fi
		else
			INSTALLATION="Custom"
		fi
	}

	# Android™ Device information grabber
	androiddevinfo()
	{
		# Device info
		# Codename
		dvc_cdn=$(getprop ro.product.device)

		# Device brand
		dvc_brnd=$(getprop ro.product.brand)

		# ROM info
		# Fingerprint, keys and related stuff
		rom_info=$(getprop ro.build.description | awk '{print $1,$3,$4,$5}')
		[[ "$rom_info" == "" ]] && rom_info=$(getprop ro.bootimage.build.description | awk '{print $1,$3,$4,$5}')
		[[ "$rom_info" == "" ]] && rom_info=$(getprop ro.system.build.description | awk '{print $1,$3,$4,$5}')

		# ARV (Android release version)
		arv=$(getprop ro.build.version.release)

		echo "Android Device Codename: $dvc_cdn"
		echo "Android Device Brand: $dvc_brnd"
		echo "Android ROM Info: $rom_info"
		echo "Android Release Version: $arv"
	}

	# Common Information
	resrchk()
	{
		echo "PID: $$"
		echo "OS: $PLATFORM"
		echo "Kernel: $(uname -sr)"
		echo "SU Provider: $(su --version)"
		echo "Memory: $(( $(infogrbn "/proc/meminfo" "MemTotal") / 1024 / 1024 + 1 ))GB"
		[[ "$(infogrblongn "/proc/cpuinfo" "Hardware")" ]] && echo "Hardware: $(infogrblongn "/proc/cpuinfo" "Hardware")" || echo "Hardware: $(infogrblongn "/proc/cpuinfo" "model name")"
		echo "Kernel Archticture: $(uname -m)"
		echo "CPU Governor: $cpu_gov"
		echo "CPU Cores: $nr_cores"
		echo "CPU Freq: MIN=$cpu_min_clk_mhz, MAX=$cpu_max_clk_mhz MHz"
		echo "CPU Usage: $cputotalusage%"
		echo "LMK Status: $lmksts"
		[[ "$batt_pctg" != "" ]] && [[ "$batt_hth" != "unknown" ]] && {
			echo "Battery Percentage: $batt_pctg%"
			echo "Battery Health: $batt_hth"
			echo "Battery Status: $batt_sts"
			echo "Battery Capacity: $batt_cpct MAh"
		}
		[[ "$PLATFORM" == "Android" ]] && androiddevinfo
		echo "Nitron Daemon Version: $(apin -dv)"
		echo "Nitron Header Version: $(apin -hv)"
		echo "Nitron Installation type: $INSTALLATION"
		echo "Nitron Current mode: $(apin -mc)"
	}

	# API Help Menu
	__api_help()
	{
		echo "
Usage: apin [OPTION(s)] (e.g. apin -rc)

Options:
  -rc, --resource-check		~ prints hardware resources information
  -dv, --daemon-version         ~ prints daemon version
  -hv, --header-version         ~ prints header version
  -mc, --mode-check		~ prints current mode
  -as, --android-status		~ updates magisk module description overlay
  -cl, --clear-log		~ clean daemon log only
  -ad, --auto-daemon		~ start up background process for automatic
  -c, --clean			~ cleans entirely all created files by daemon
  -h, --help			~ prints this help menu
"
	}

	# Start Installation type function
	instype

	case $* in
		"-rc" | "--resource-check")
			resrchk
		;;
		"-dv" | "--daemon-version")
			echo "$NITRON_VERSION"
		;;
		"-hv" | "--header-version")
			echo "$NITRON_HEADER_VERSION"
		;;
		"-mc" | "--mode-check")
			modelockn
			echo "$MODES"
		;;
		"-as" | "--android-status")
			if [[ "$PLATFORM" == "Android" ]]; then
				if [[ "$INSTALLATION" == "Magisk Module" ]]; then
					case "$(apin -mc)" in
						"Battery")
							sed -i '/description=/s/.*/description=[ 🟩 Green mode applied ], Extensive Optmized Kernel Tweaker Daemon By: TITΛN × Noobies./' "/data/adb/modules/nitrond.magisk/module.prop"
						;;
						"Balanced")
							sed -i '/description=/s/.*/description=[ 🟨 Balanced mode applied ], Extensive Optmized Kernel Tweaker Daemon By: TITΛN × Noobies./' "/data/adb/modules/nitrond.magisk/module.prop"
						;;
						"Gaming")
							sed -i '/description=/s/.*/description=[ 🟥 Gaming mode applied ], Extensive Optmized Kernel Tweaker Daemon By: TITΛN × Noobies./' "/data/adb/modules/nitrond.magisk/module.prop"
						;;
						"Automatic"*)
							sed -i '/description=/s/.*/description=[ ⚡ Automatic mode applied ], Extensive Optmized Kernel Tweaker Daemon By: TITΛN × Noobies./' "/data/adb/modules/nitrond.magisk/module.prop"
						;;
						*)
							sed -i '/description=/s/.*/description=[ 🤔 Uninitialized ], Extensive Optmized Kernel Tweaker Daemon By: TITΛN × Noobies./' "/data/adb/modules/nitrond.magisk/module.prop"
						;;
					esac
				fi
			fi
		;;
		"-c" | "--clean")
			UPDATECACHE=("$NITRON_LOG_DIR/nitrond_src_cache" "$NITRON_LOG_DIR/nitronh_src_cache")
			BACKUPCACHE=("$NITRON_LOG_DIR/nitrond_current" "$NITRON_LOG_DIR/nitronh_current")
			MODELOCK="$NITRON_LOG_DIR/nitron.mode.lock"
			printn -i "Removing update caches..."
			rm -rf "${UPDATECACHE[@]}"
			printn -i "Removing Old Backups..."
			rm -rf "${BACKUPCACHE[@]}"
			printn -i "Resetting Mode information..."
			rm -rf "$MODELOCK"
			modelockn
		;;
		"-cl" | "--clear-log")
			rm -rf "$NITRON_LOG_DIR"/nitron.log
		;;
		"-ad" | "--auto-daemon")
			[[ ! -f "$NITRON_RELAX_DIR/nitron.auto.conf" ]] && echo "# The nitrond Config File
# Optimise packages up on resource usage and load
# List all package/app names according to your needs
com.tencent.ig
com.mojang.minecraftpe
com.activision.callofduty.shooter
			" >> "$NITRON_RELAX_DIR/nitron.auto.conf"
			export SOURCE="api-auto"
			auto()
			{
				autoalg() {
						if [[ "$batt_pctg" -lt "25" ]]; then
							if [[ "$(apin -mc | awk '{print $2}')" != "green" ]]; then
								magicn -g 2>&1 >/dev/null 2>&1
								printn -ll "battery is under %25, applied green mode"
							fi
						else
							if (( cputotalusage >= "55" && cputotalusage <= "74" )); then
								if [[ "$(apin -mc | awk '{print $2}')" != "yellow" ]]; then
									printn -ll "cpu usage is 55%+"
									magicn -y 2>&1 >/dev/null 2>&1
									printn -ll "heavy process(es) detected, applied balance mode."
								fi
							elif (( cputotalusage >= "75" )); then
								if [[ "$(apin -mc | awk '{print $2}')" != "red" ]]; then
										printn -ll "cpu usage is 75%+"
										magicn -r 2>&1 >/dev/null 2>&1
										printn -ll "cpu is under load applied Red mode, consuming battery."
								fi
							fi
						fi
				}

				vars # update variables each execution
				if [[ $(pgrep -f -c $PIDS) -gt 0 ]]; then
					autoalg
				elif [[ $PIDS == *"all"* ]]; then
					autoalg
				fi
			}
			while [[ "$SOURCE" == "api-auto" ]] && true; do
				if [[ "$TRAPAUTO" == "true" ]]; then
					exit
				else
					PIDS=$(cat "$NITRON_RELAX_DIR"/nitron.auto.conf | tail -n +4)
					auto
				fi
			done
		;;
		"-h" | "--help")
			__api_help
		;;
		*)
			__api_help
			return 1
		;;
	esac
}

console_dialog() {
	mainmenu() {
		PR_PREFIX="console_dialog"
		HEIGHT=16
		WIDTH=40
		CHOICE_HEIGHT=30
		BACKTITLE="The Open NitroN Kernel tweaking Project"
		MENU="Choose one of the following options: "
		OPTIONS=(1 "Switch Mode"
			2 "Show device stats"
			3 "Update"
			4 "Show help menu"
			5 "Exit"
		)
		CHOICE=$(dialog --clear \
			--backtitle "$BACKTITLE" \
			--title "$TITLE" \
			--menu "$MENU" \
			$HEIGHT $WIDTH $CHOICE_HEIGHT \
			"${OPTIONS[@]}" \
			2>&1 >/dev/tty)
	}
		mainmenu
		clear
		case "${CHOICE}" in
			1)
				submenu() {
					MENU="Choose one of the following Modes: "
					SUBOPTIONS=(1 "Battery (Green)"
						2 "Balanced (Yellow)"
						3 "Gaming (Red)"
						4 "Back to main menu"
						5 "Exit"
					)
					SUBCHOICE=$(dialog --clear \
						--backtitle "$BACKTITLE" \
						--title "$TITLE" \
						--menu "$MENU" \
						$HEIGHT $WIDTH $CHOICE_HEIGHT \
						"${SUBOPTIONS[@]}" \
						2>&1 >/dev/tty)
				}
				submenu
				clear
				case "${SUBCHOICE}" in
					1)
						clear
						magicn -g
						printn -i "Proccess Completed!"
						echo -ne "\e[1mPress enter to continue or 0 to exit! \e[0m"
						read -r a1
						if [ "$a1" == "0" ]; then
 							return 0
 						else
							clear
							submenu
						fi
					;;
					2)
						clear
						magicn -y
						printn -i "Proccess Completed!"
						echo -ne "\e[1mPress enter to continue or 0 to exit! \e[0m"
						read -r a1
						if [ "$a1" == "0" ]; then
							return 0
 						else
							clear
							submenu
						fi
					;;
					3)
						clear
						magicn -r
						printn -i "Proccess Completed!"
						echo -ne "\e[1mPress enter to continue or 0 to exit! \e[0m"
						read -r a1
						if [ "$a1" == "0" ]; then
 							return 0
 						else
							clear
							submenu
						fi
					;;
					4)
						clear
						mainmenu
					;;
					5)
						clear
						exit 0
					;;
				esac
			;;
			2)
				clear
				apin -rc
				echo -ne "\e[1mPress enter to continue or 0 to exit! \e[0m"
				read -r a2
				if [ "$a2" == "0" ]; then
 					return 0
 				else
					clear
					mainmenu
				fi
			;;
			3)
				updaten -a; return 0
				echo -ne "\e[1mPress enter to continue or 0 to exit! \e[0m"
				read -r a2
				if [ "$a2" == "0" ]; then
 					return 0
 				else
					clear
					mainmenu
				fi
			;;
			4)
				__nitron_help
				echo -ne "\e[1mPress enter to continue or 0 to exit! \e[0m"
				read -r a2
				if [ "$a2" == "0" ]; then
 					return 0
 				else
					clear
					mainmenu
				fi
			;;
			5)
				clear
				exit 0
			;;
		esac
}

print_banner() {
	echo "
 _   _ _ _             _   _
| \ | (_) |_ _ __ ___ | \ | |
|  \| | | __| '__/ _ \|  \| |
| |\  | | |_| | | (_) | |\  |
|_| \_|_|\__|_|  \___/|_| \_|
"
}

console_legacy() {
	PR_PREFIX="console_legacy"
	while :
	do
	clear
	print_banner
	COLUMNS=150
	OPTIONS=("Switch Mode" "Show device state" "Update" "Show help menu" "Exit")
	PS3="?): "
		select CHOICE in "${OPTIONS[@]}"; do
			num=$REPLY
			case $num in
				1)
					while :; do
						clear
						print_banner
						COLUMNS=150
						MODE_OPTIONS=("Gaming" "Balance" "Battery" "Back to main menu" "Exit")
						PS3="?): "
						select MODE_CHOICE in "${MODE_OPTIONS[@]}"; do
							mode_num=$REPLY
							case $mode_num in
								1)
									magicn -r
									printn -n "Gaming Mode activated."
									sleep 2
									break
									;;
								2)
									magicn -y
									printn -n "Balance Mode activated."
									sleep 2
									break
									;;
								3)
									magicn -g
									printn -n "Battery Mode activated."
									sleep 2
									break
									;;
								4)
									break 3
									;;
								5)
									exit 0
									;;
								*)
									printn -e "[$mode_num] unknown option"
									sleep 2
									break
									;;
							esac
						done
					done
					;;
				2)
					apin -rc
					;;
				3)
					updaten
					break
					;;
				4)
					__nitron_help
					;;
				5)
					break 2
					;;
				*)
					printn -w "[$num] unknown option"
					sleep 2
					break
					;;
			esac
		done
	done
}

