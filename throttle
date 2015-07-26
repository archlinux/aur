#!/bin/bash

while (( "$#" )); do
  #Find the number of physical cores (for hyperthreading control)
  CORES="$(grep "^core id" /proc/cpuinfo | sort -u | wc -l)"
  case "$1" in
    full|performance|cut|powersave)
      case "$1" in
        full|performance)
          GOVERNOR="performance"
          XPSTURBO="0"
          HYPERTHREADS="1"
          ENERGYPERF="0"
          LAPTOP="0"
          DIRTYWBC="500"
          NMIDOG="0" # Always off
          POLICY="max_performance"
          APM="255"
          AAM="254"
          CONTROL="on"
          AUTOSUSPEND="-1"
          POWERSAVE="0"
          CONTROLLER="N"
          WLPOWERSAVE="off"
          WOLA="g"
          WOLB="enabled"
          LEDBRIGHT="255"
          NVPM="1"
        ;;
        cut|powersave)
          GOVERNOR="powersave"
          XPSTURBO="1"  
          HYPERTHREADS="0"
          ENERGYPERF="15"
          LAPTOP="5"
          DIRTYWBC="1500"
          NMIDOG="0"
          POLICY="min_power"
          APM="1"
          AAM="128"
          CONTROL="auto"
          AUTOSUSPEND="1"
          POWERSAVE="1"
          CONTROLLER="Y"
          WLPOWERSAVE="on"
          WOLA="d"
          WOLB="disabled"
          LEDBRIGHT="0"
          NVPM="0"
        ;;
      esac

      # CPU Governor
      for i in /sys/bus/cpu/drivers/processor/cpu*/cpufreq/scaling_governor; do [[ -f "${i}" ]] && \
        printf "${GOVERNOR}" > "${i}" & done &

      # Disable Intel P-State Turbo
      [[ -f /sys/devices/system/cpu/intel_pstate/no_turbo ]] && \
        printf "${XPSTURBO}" > /sys/devices/system/cpu/intel_pstate/no_turbo &

      # Hyperthreads
      for i in /sys/devices/system/cpu/cpu*/online; do  [[ -f "${i}" ]] && \
      [[ "$(printf "${i}" | tr -cd [:digit:])" -ge "${CORES}" ]] && \
        printf "${HYPERTHREADS}" > "${i}" & done &
      wait # for cpus on/off

      # ENERGY_PERF_BIAS
      [[ -n "$(command -v x86_energy_perf_policy)" ]] && \
        x86_energy_perf_policy "${ENERGYPERF}" &

      # Virtual Memory (Swap)
      printf "${LAPTOP}" > /proc/sys/vm/laptop_mode &
      printf "${DIRTYWBC}" > /proc/sys/vm/dirty_writeback_centisecs &
      printf "${DIRTYWBC}" > /proc/sys/vm/dirty_expire_centisecs &

      # NMI watchdog
      [[ -f /proc/sys/kernel/watchdog ]] && \
        printf "${NMIDOG}" > /proc/sys/kernel/watchdog &

      # SATA link power management
      for i in /sys/class/scsi_host/host*/link_power_management_policy; do [[ -f "${i}" ]] && \
        printf "${POLICY}" > "${i}" & done &

      # Hard drives
      [[ -n "$(command -v hdparm)" ]] && \
        hdparm -qB "${APM}" -qM "${AAM}" /dev/[hs]d[a-z] 2> /dev/null &

      # Runtime power management for devices (by class and bus)
      for i in /sys/{class/*,bus/*/devices}/*/power/control; do [[ -f "${i}" ]] && \
        printf "$CONTROL" > "${i}" & done &

      # USB Autosuspend (may disable some older devices!)
      for i in /sys/bus/usb/devices/*/power/autosuspend{,_delay_ms}; do [[ -f "${i}" ]] && \
        printf "$AUTOSUSPEND" > "${i}" & done &

      # Powersaving for modules
      for i in /sys/module/*/parameters/power_save; do \
        printf "${POWERSAVE}" > "${i}" & done &
      for i in /sys/module/*/parameters/power_save_controller; do \
        printf "${CONTROLLER}" > "${i}" & done &

      # Network powersaving
      for i in /sys/class/net/wl*; do [[ -d "${i}" ]] && \
        [[ -n "$(command -v iw)" ]] && \
          iw dev "$(printf "${i}" | sed 's/^.*wl/wl/')" set power_save "${WLPOWERSAVE}" 2> /dev/null & done &
      for i in /sys/class/net/e*; do [[ -d "${i}" ]] && \
        [[ -n "$(command -v ethtool)" ]] && \
          ethtool -s "$(printf "${i}" | sed 's/^.*e/e/')" wol "${WOLA}" 2> /dev/null & done &
      for i in /sys/class/net/*/device/power/wakeup; do [[ -f "${i}" ]] && \
        printf "${WOLB}" > "${i}" & done &

      # LEDs
      for i in /sys/class/leds/*/brightness; do [[ -f "${i}" ]] && \
        printf "${LEDBRIGHT}" > "${i}" & done &

      # Nvidia PowerMizer
      [[ -n "$(command -v nvidia-settings)" ]] && \
        DISPLAY=":0.0" nvidia-settings -a [gpu:0]/GPUPowerMizerMode="${NVPM}" > /dev/null &

      wait # Hey, let's stop! :) *stops* ... YAY! =D
      shift
      unset GOVERNOR XPSTURBO HYPERTHREADS ENERGYPERF LAPTOP DIRTYWBC NMIDOG \
            POLICY APM AAM CONTROL AUTOSUSPEND POWERSAVE CONTROLLER \
            WLPOWERSAVE WOLA WOLB LEDBRIGHT NVPM
    ;;
    gov*)
      case "${1}" in \
        gov-full) GOVERNOR="performance" ;; \
        gov-cut) GOVERNOR="powersave" ;; esac
      [[ -z "${GOVERNOR}" ]] && \
        case "${2}" in \
          full|performance) GOVERNOR="performance"; SHIFT="2" ;; \
          cut|powersave) GOVERNOR="powersave"; SHIFT="2" ;; esac
      [[ -z "${GOVERNOR}" ]] && \
        printf "${0} gov {cut,full} - CPU Governor\n" || \
      for i in /sys/bus/cpu/drivers/processor/cpu*/cpufreq/scaling_governor; do [[ -f "${i}" ]] && \
        printf "${GOVERNOR}" > ${i} & done &
      shift "${SHIFT}"
      wait
      unset GOVERNOR SHIFT
    ;;
    turbo*)
      case "${1}" in \
        turbo-on) XPSTURBO="0" ;; \
        turbo-off) XPSTURBO="1" ;; esac
      [[ -z "${XPSTURBO}" ]] && \
        case "${2}" in \
          on|performance) XPSTURBO="0"; SHIFT="2" ;; \
          off|powersave) XPSTURBO="1"; SHIFT="2" ;; esac
      [[ -z "${XPSTURBO}" ]] && \
        printf "${0} turbo {on,off} - Intel P-State Turbo\n" || \
      [[ -f /sys/devices/system/cpu/intel_pstate/no_turbo ]] && \
        printf "${XPSTURBO}" > /sys/devices/system/cpu/intel_pstate/no_turbo &
      shift "${SHIFT}"
      wait
      unset XPSTURBO SHIFT
    ;;
    ht*)
      case "${1}" in \
        ht-on) HYPERTHREADS="1" ;; \
        ht-off) HYPERTHREADS="0" ;; esac
      [[ -z "${HYPERTHREADS}" ]] && \
        case "${2}" in \
          on|performance) HYPERTHREADS="1";  SHIFT="2" ;; \
          off|powersave) HYPERTHREADS="0"; SHIFT="2" ;; esac
      [[ -z "${HYPERTHREADS}" ]] && \
        printf "${0} ht {on,off} - Hyperthreads\n" || \
      for i in /sys/devices/system/cpu/cpu*/online; do  [[ -f "${i}" ]] && \
        [[ "$(printf "${i}" | tr -cd [:digit:])" -ge "${CORES}" ]] && \
          printf "${HYPERTHREADS}" > "${i}" & done &
      shift "${SHIFT}"
      wait
      unset HYPERTHREADS SHIFT
    ;;
    gpu*)
      case "${1}" in \
        gpu-full) NVPM="1" ;; \
        gpu-cut) NVPM="0" ;; esac
      [[ -z "${NVPM}" ]] && \
        case "${2}" in \
          full|performance) NVPM="1"; SHIFT="2" ;; \
          cut|powersave) NVPM="0"; SHIFT="2" ;; esac
      [[ -z "${NVPM}" ]] && \
        printf "${0} gpu {cut,full} - GPU runtime powersaving (only Nvidia ATM)\n" || \
      [[ -z "$(command -v nvidia-settings)" ]] && \
        printf "nvidia-settings not found; only nvidia currently supported" || \
      DISPLAY=":0.0" nvidia-settings -a [gpu:0]/GPUPowerMizerMode="${NVPM}" > /dev/null &
      shift "${SHIFT}"
      wait
      unset NVPM SHIFT
    ;;
    check)
      printf "\nCPU Governor\n/sys/bus/cpu/drivers/processor/cpu*/cpufreq/scaling_governor\n"
      for i in /sys/bus/cpu/drivers/processor/cpu*/cpufreq/scaling_governor; do [[ -f "${i}" ]] && \
        printf "${i}\n$(cat ${i})\n"; done | sed 's|/sys/bus/cpu/drivers/processor/||g; s|/.*||g; N;s|\n|\t|'

      [[ -f /sys/devices/system/cpu/intel_pstate/no_turbo ]] && \
        printf "\nDisable Intel P-State Turbo\n/sys/devices/system/cpu/intel_pstate/no_turbo\n"; \
        printf "no_turbo\n$(cat /sys/devices/system/cpu/intel_pstate/no_turbo)\n" | sed 'N;s|\n|\t|'

      printf "\nHyperthreads\n/sys/devices/system/cpu/cpu*/online\n"
      for i in /sys/devices/system/cpu/cpu*/online; do [[ -f "${i}" ]] && \
        [[ $(printf "${i}" | tr -cd [:digit:]) -ge "$CORES" ]] && \
          printf "${i}\n$(cat ${i})\n"; done | sed 's|/sys/devices/system/cpu/||g; s|/.*||g; N;s|\n|\t|'

      [[ -z "$(command -v x86_energy_perf_policy)" ]] && \
        printf "\nEnergy Perf Bias\n" && \
        x86_energy_perf_policy -r #SUID

      printf "\nVirtual Memory (Swap)\n/proc/sys/vm/\n"
      printf "laptop_mode\t$(cat /proc/sys/vm/laptop_mode)\n"
      printf "dirty_writeback_centisecs\t$(cat /proc/sys/vm/dirty_writeback_centisecs)\n"
      printf "dirty_expire_centisecs\t$(cat /proc/sys/vm/dirty_expire_centisecs)\n"

      [[ -f /proc/sys/kernel/watchdog ]] && \
        printf "\nNMI watchdog\n" && \
        printf "/proc/sys/kernel/watchdog\t$(cat /proc/sys/kernel/watchdog)\n"

      printf "\nSATA link power management\n/sys/class/scsi_host/host*/link_power_management_policy\n"
      for i in /sys/class/scsi_host/host*/link_power_management_policy; do [[ -f "${i}" ]] && \
        printf "${i}\n$(cat ${i})\n"; done | sed 's|/sys/class/scsi_host/||g; s|/.*||g; N;s|\n|\t|'

      [[ -n "$(command -v hdparm)" ]] && \
        printf "\nHard drives\n/dev/[hs]d[a-z]\n" && \
        hdparm -B -M /dev/[hs]d[a-z] 2> /dev/null | sed 'N;s|\n||g; s|/dev/||g; s|\t| |g;' #SUID

      printf "\nRuntime power management\n/sys/{class,bus}/*/{*,devices/*}/power/control\n"
      for i in /sys/{class,bus}/*/{*,devices/*}/power/control; do [[ -f "${i}" ]] && \
        printf "${i}\n$(cat ${i})\n"; done | sed 's|/sys/class/||g; s|/sys/bus/||g; s|/devices||g; s|/power/control||g; N;s|\n|\t|'

      printf "\nUSB Autosuspend (may disable some older devices!)\n/sys/bus/usb/devices/*/power/autosuspend{,_delay_ms}\n"
      for i in /sys/bus/usb/devices/*/power/autosuspend{,_delay_ms}; do [[ -f "${i}" ]] && \
        printf "${i}\n$(cat ${i})\n"; done | sed 's|/sys/bus/usb/devices/||g; s|/.*||g; N;s|\n|\t|'

      printf "\nPower saving for modules\n/sys/module/*/parameters/power_save{,_controller}\n"
      for i in /sys/module/*/parameters/power_save{,_controller}; do [[ -f "${i}" ]] && \
        printf "${i}\n$(cat ${i})\n"; done | sed 's|/sys/module/||g; s|/parameters/.*||g; s|/.*||g; N;s|\n|\t|'

      printf "\nNetwork device powersaving\n/sys/class/net/{wl*,e*,*/device/power/wakeup}\n";
      [[ -n "$(command -v iw)" ]] && \
        for i in /sys/class/net/wl*; do [[ -d "${i}" ]] && \
        printf "${i}\n$(iw dev $(printf ${i} | sed 's/^.*wl/wl/') get power_save)"; done | sed 's|^\t|  |g;s|/sys/class/net/||g; s|/.*||g'
      [[ -n "$(command -v ethtool)" ]] && \
        for i in /sys/class/net/e*; do [[ -d "${i}" ]] && \
        printf "${i}\n$(ethtool $(printf ${i} | sed 's/^.*e/e/') | grep Wake-on)"; done | sed 's|^\t|  |g;s|/sys/class/net/||g; s|/.*||g'
      for i in /sys/class/net/*/device/power/wakeup; do [[ -f "${i}" ]] && \
        printf "${i}\n$(cat ${i})\n"; done | sed 's|/sys/class/net/||g; s|/device/power/wakeup||g; s|/.*||g; N;s|\n|\t|'

      printf "\nLEDs\n/sys/class/leds/*/brightness\n"
      for i in /sys/class/leds/*/brightness; do [[ -f "${i}" ]] && \
        printf "${i}\n$(cat ${i})\n"; done | sed 's|/sys/class/leds/||g; s|/brightness||g; s|/.*||g; N;s|\n|\t|'

      [[ -n "$(command -v nvidia-settings)" ]] && \
        printf "\nNvidia PowerMizer\n" && \
        DISPLAY=":0.0" nvidia-settings -q [gpu:0]/GPUPowerMizerMode | grep "Attribute" | sed 's|.*\[||g;s|\]):||g;s| |\t|g;s|\.$||g'
      shift
    ;;
    *|help)
      [[ ! "${1}" == "help" ]] && \
        printf "Invalid input: $@\n"
      printf "\nRuntime power management:\n"
      printf "${0} {cut,full} - system-wide runtime powersaving\n"
      printf "${0} check - inspect runtime powersaving\n"
      printf "\nExtras:\n"
      printf "${0} gov {cut,full} - CPU Governor\n"
      printf "${0} turbo {on,off} - Intel P-State Turbo\n"
      printf "${0} ht {on,off} - Hyperthreads\n"
      printf "${0} gpu {cut,full} - GPU runtime powersaving (only Nvidia ATM)\n"
      printf "\nOptions can take {performace,powersave} and are stackable:\n"
      printf "\n${0} powersave gov full turbo on gpu full ht on check\n"
      exit
    ;;
  esac
done
