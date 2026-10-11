#!/bin/bash
# NVIDIA eGPU hotplug handler script
# Handles module loading/unloading for Thunderbolt eGPU hotplug

ACTION="$1"
DEVICE="$2"

log() {
    /usr/bin/logger --tag nvidia-egpu-hotplug -- "[$ACTION] $*"
}

run_logged() {
    local output status line command_name="$1"

    shift
    if output=$("$@" 2>&1); then
        status=0
    else
        status=$?
    fi

    while IFS= read -r line; do
        [ -n "$line" ] && log "$command_name: $line"
    done <<< "$output"

    return "$status"
}

NVIDIA_EGPU_KILL_PROCESSES="${NVIDIA_EGPU_KILL_PROCESSES:-0}"
case "$NVIDIA_EGPU_KILL_PROCESSES" in
    0|1) ;;
    *)
        log "Invalid NVIDIA_EGPU_KILL_PROCESSES value '$NVIDIA_EGPU_KILL_PROCESSES'; keeping it disabled"
        NVIDIA_EGPU_KILL_PROCESSES=0
        ;;
esac

NVIDIA_EGPU_DISABLE_BRIDGE="${NVIDIA_EGPU_DISABLE_BRIDGE:-}"
NVIDIA_EGPU_DISABLE_BRIDGE="${NVIDIA_EGPU_DISABLE_BRIDGE,,}"
if [ -n "$NVIDIA_EGPU_DISABLE_BRIDGE" ] &&
   [[ ! "$NVIDIA_EGPU_DISABLE_BRIDGE" =~ ^[[:xdigit:]]{4}:[[:xdigit:]]{2}:[[:xdigit:]]{2}\.[0-7]$ ]]; then
    log "Invalid NVIDIA_EGPU_DISABLE_BRIDGE value '$NVIDIA_EGPU_DISABLE_BRIDGE'; bridge workaround disabled"
    NVIDIA_EGPU_DISABLE_BRIDGE=""
fi

BRIDGE_REMOVED_FOR_REBAR=0

disable_configured_bridge() {
    local device="$1"
    local bridge_path="/sys/bus/pci/devices/$NVIDIA_EGPU_DISABLE_BRIDGE"
    local device_path="/sys/bus/pci/devices/$device"
    local bridge_realpath device_realpath device_upstream bridge_parent device_upstream_parent bridge_class

    [ -n "$NVIDIA_EGPU_DISABLE_BRIDGE" ] || return 1

    if [ ! -d "$bridge_path" ] || [ ! -d "$device_path" ]; then
        log "Configured bridge or eGPU device is missing; cannot apply bridge workaround"
        return 1
    fi

    bridge_realpath=$(readlink -f -- "$bridge_path")
    device_realpath=$(readlink -f -- "$device_path")
    device_upstream=$(dirname -- "$device_realpath")
    bridge_parent=$(dirname -- "$bridge_realpath")
    device_upstream_parent=$(dirname -- "$device_upstream")

    if [ "$bridge_realpath" = "$device_upstream" ] ||
       [ "$bridge_parent" != "$device_upstream_parent" ]; then
        log "Configured bridge $NVIDIA_EGPU_DISABLE_BRIDGE is not a sibling of eGPU $device; refusing to remove it"
        return 1
    fi

    bridge_class=$(cat "$bridge_path/class" 2>/dev/null)
    case "$bridge_class" in
        0x0604*) ;;
        *)
            log "Configured device $NVIDIA_EGPU_DISABLE_BRIDGE is not a PCI-to-PCI bridge; refusing to remove it"
            return 1
            ;;
    esac

    log "Removing sibling PCI bridge $NVIDIA_EGPU_DISABLE_BRIDGE before NVIDIA module load"
    if ! printf '1\n' > "$bridge_path/remove"; then
        log "Failed to remove configured PCI bridge $NVIDIA_EGPU_DISABLE_BRIDGE"
        return 1
    fi

    BRIDGE_REMOVED_FOR_REBAR=1
}

restore_configured_bridge() {
    local bridge_path="/sys/bus/pci/devices/$NVIDIA_EGPU_DISABLE_BRIDGE"

    [ -n "$NVIDIA_EGPU_DISABLE_BRIDGE" ] || return 0
    if [ -d "$bridge_path" ]; then
        log "PCI bridge $NVIDIA_EGPU_DISABLE_BRIDGE is present"
        return 0
    fi

    if [ ! -w /sys/bus/pci/rescan ]; then
        log "Cannot rescan PCI to restore bridge $NVIDIA_EGPU_DISABLE_BRIDGE"
        return 1
    fi

    log "Rescanning PCI to restore bridge $NVIDIA_EGPU_DISABLE_BRIDGE"
    if ! printf '1\n' > /sys/bus/pci/rescan; then
        log "PCI rescan failed while restoring bridge $NVIDIA_EGPU_DISABLE_BRIDGE"
        return 1
    fi

    if [ -d "$bridge_path" ]; then
        log "Restored PCI bridge $NVIDIA_EGPU_DISABLE_BRIDGE"
    else
        log "PCI bridge $NVIDIA_EGPU_DISABLE_BRIDGE remains absent after rescan"
        return 1
    fi
}

# Count remaining NVIDIA GPUs in sysfs
count_nvidia_gpus() {
    local count=0
    for dir in /sys/bus/pci/devices/*; do
        if [ -f "$dir/vendor" ] && [ -f "$dir/class" ]; then
            vendor=$(cat "$dir/vendor" 2>/dev/null)
            class=$(cat "$dir/class" 2>/dev/null)
            log "DEBUG: $dir vendor=$vendor class=$class"
            # Check for NVIDIA (0x10de) and display class (0x0300xx or 0x0302xx)
            if [ "$vendor" = "0x10de" ]; then
                case "$class" in
                    0x030000|0x030200|0x030800)
                        count=$((count + 1))
                        log "Found NVIDIA GPU at $dir (class=$class)"
                        ;;
                    *)
                        log "Found NVIDIA non-GPU at $dir (class=$class)"
                        ;;
                esac
            fi
        fi
    done
    log "DEBUG: Total NVIDIA GPUs counted: $count"
    echo $count
}

# Get PIDs that have nvidia device files open (without using fuser)
get_nvidia_pids() {
    local pids=""
    for fd_dir in /proc/[0-9]*/fd; do
        pid=$(echo "$fd_dir" | cut -d'/' -f3)
        # Check if any fd points to nvidia device
        if ls -la "$fd_dir" 2>/dev/null | grep -q '/dev/nvidia'; then
            pids="$pids $pid"
        fi
    done
    echo $pids | tr ' ' '\n' | sort -u | tr '\n' ' '
}

terminate_nvidia_processes() {
    local pids waited

    pids=$(get_nvidia_pids)
    if [ -z "$pids" ]; then
        log "No processes using NVIDIA devices"
        return
    fi

    log "Sending SIGTERM to processes using NVIDIA: $pids"
    for pid in $pids; do
        kill -TERM "$pid" 2>/dev/null
    done

    waited=0
    while [ "$waited" -lt 10 ]; do
        sleep 1
        waited=$((waited + 1))
        pids=$(get_nvidia_pids)
        if [ -z "$pids" ]; then
            log "All NVIDIA processes exited"
            break
        fi
        log "Waiting for processes to exit... ($waited/10s)"
    done

    pids=$(get_nvidia_pids)
    if [ -n "$pids" ]; then
        log "Force killing remaining processes: $pids"
        for pid in $pids; do
            kill -KILL "$pid" 2>/dev/null
        done
        sleep 2
    fi
}

unload_nvidia_modules() {
    local attempt mod remaining failed still_loaded

    for attempt in 1 2 3; do
        remaining=$(count_nvidia_gpus)
        if [ "$remaining" -gt 0 ]; then
            log "NVIDIA GPU detected before unload attempt $attempt/3; aborting unload"
            return
        fi

        log "Unloading NVIDIA modules (attempt $attempt/3)..."
        failed=""
        for mod in nvidia_uvm nvidia_drm nvidia_modeset nvidia; do
            if lsmod | grep -q "^$mod "; then
                log "Unloading $mod..."
                if ! run_logged modprobe modprobe -r "$mod"; then
                    log "Failed to unload $mod"
                    failed="$failed $mod"
                fi
            fi
        done

        if [ -z "$failed" ]; then
            log "NVIDIA modules unloaded on attempt $attempt/3"
            return
        fi

        if [ "$attempt" -lt 3 ]; then
            log "Unload attempt $attempt/3 failed for:$failed; retrying in 10 seconds"
            sleep 10
        fi
    done

    still_loaded=""
    for mod in nvidia_uvm nvidia_drm nvidia_modeset nvidia; do
        if lsmod | grep -q "^$mod "; then
            still_loaded="$still_loaded $mod"
        fi
    done
    if [ -n "$still_loaded" ]; then
        log "Module unload failed after 3 attempts; still loaded:$still_loaded"
    else
        log "NVIDIA modules unloaded after retries"
    fi
}

delayed_unload() {
    local pids remaining

    log "Starting module unload sequence..."

    remaining=$(count_nvidia_gpus)
    if [ "$remaining" -gt 0 ]; then
        log "GPU detected again, aborting unload"
        return
    fi

    pids=$(get_nvidia_pids)
    if [ "$NVIDIA_EGPU_KILL_PROCESSES" = "1" ]; then
        terminate_nvidia_processes
    elif [ -n "$pids" ]; then
        log "Processes still use NVIDIA devices ($pids); termination is disabled, attempting module unload anyway"
    else
        log "No processes using NVIDIA devices"
    fi

    remaining=$(count_nvidia_gpus)
    if [ "$remaining" -gt 0 ]; then
        log "GPU detected again, aborting unload"
        return
    fi

    unload_nvidia_modules

    if lsmod | grep -Eq '^(nvidia|nvidia_uvm|nvidia_drm|nvidia_modeset) '; then
        log "NVIDIA modules remain loaded; deferring PCI bridge restoration"
    else
        restore_configured_bridge
    fi
}

# Load NVIDIA modules
load_nvidia_modules() {
    log "Loading NVIDIA modules..."
    run_logged modprobe modprobe nvidia
    run_logged modprobe modprobe nvidia_modeset
    run_logged modprobe modprobe nvidia_drm
    run_logged modprobe modprobe nvidia_uvm
    log "Module load complete"
}

case "$ACTION" in
    remove)
        log "GPU removed: $DEVICE"

        remaining=$(count_nvidia_gpus)
        log "Remaining NVIDIA GPUs: $remaining"
        
        if [ "$remaining" -eq 0 ]; then
            log "No NVIDIA GPUs remaining, starting cleanup..."
            # Run unload via systemd-run to escape udev process killing
            # udev kills background processes, so we must use systemd-run
            if run_logged systemd-run systemd-run --no-block --unit="nvidia-egpu-unload-$$" \
                --setenv="NVIDIA_EGPU_KILL_PROCESSES=$NVIDIA_EGPU_KILL_PROCESSES" \
                --setenv="NVIDIA_EGPU_DISABLE_BRIDGE=$NVIDIA_EGPU_DISABLE_BRIDGE" \
                /usr/lib/nvidia-egpu/nvidia-egpu-hotplug.sh unload; then
                log "Spawned nvidia-egpu-unload-$$ via systemd-run"
            else
                log "Failed to start unload via systemd-run"
            fi
        else
            log "Other NVIDIA GPUs still present, keeping modules loaded"
        fi
        ;;

    unload)
        delayed_unload
        ;;
        
    add)
        log "GPU added: $DEVICE"
        # Modules should auto-load, but ensure they're loaded
        if ! lsmod | grep -q "^nvidia "; then
            if [ -n "$NVIDIA_EGPU_DISABLE_BRIDGE" ]; then
                disable_configured_bridge "$DEVICE" || \
                    log "Continuing without the configured PCI bridge workaround"
            fi
            load_nvidia_modules
            if [ "$BRIDGE_REMOVED_FOR_REBAR" -eq 1 ]; then
                restore_configured_bridge
            fi
        elif [ -n "$NVIDIA_EGPU_DISABLE_BRIDGE" ]; then
            log "NVIDIA modules are already loaded; skipping PCI bridge workaround"
        fi
        ;;
        
    *)
        log "Unknown action: $ACTION"
        exit 1
        ;;
esac

exit 0
