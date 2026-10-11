#!/bin/bash
# NVIDIA eGPU hotplug handler script
# Handles module loading/unloading for Thunderbolt eGPU hotplug

LOGFILE="/var/log/nvidia-egpu-hotplug.log"
ACTION="$1"
DEVICE="$2"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$ACTION] $*" >> "$LOGFILE"
}

NVIDIA_EGPU_KILL_PROCESSES="${NVIDIA_EGPU_KILL_PROCESSES:-0}"
case "$NVIDIA_EGPU_KILL_PROCESSES" in
    0|1) ;;
    *)
        log "Invalid NVIDIA_EGPU_KILL_PROCESSES value '$NVIDIA_EGPU_KILL_PROCESSES'; keeping it disabled"
        NVIDIA_EGPU_KILL_PROCESSES=0
        ;;
esac

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
                if ! modprobe -r "$mod" 2>> "$LOGFILE"; then
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

    log "Starting delayed module unload sequence..."
    sleep 1

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
}

# Load NVIDIA modules
load_nvidia_modules() {
    log "Loading NVIDIA modules..."
    modprobe nvidia
    modprobe nvidia_modeset
    modprobe nvidia_drm
    modprobe nvidia_uvm
    log "Module load complete"
}

case "$ACTION" in
    remove)
        log "GPU removed: $DEVICE"
        
        # Wait for kernel to fully process the removal
        # Thunderbolt removal can take several seconds to propagate
        sleep 5
        
        remaining=$(count_nvidia_gpus)
        log "Remaining NVIDIA GPUs: $remaining"
        
        if [ "$remaining" -eq 0 ]; then
            log "No NVIDIA GPUs remaining, starting cleanup..."
            # Run unload via systemd-run to escape udev process killing
            # udev kills background processes, so we must use systemd-run
            if systemd-run --no-block --unit="nvidia-egpu-unload-$$" \
                --setenv="NVIDIA_EGPU_KILL_PROCESSES=$NVIDIA_EGPU_KILL_PROCESSES" \
                /usr/lib/nvidia-egpu/nvidia-egpu-hotplug.sh unload; then
                log "Spawned nvidia-egpu-unload-$$ via systemd-run"
            else
                log "Failed to start delayed unload via systemd-run"
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
            load_nvidia_modules
        fi
        ;;
        
    *)
        log "Unknown action: $ACTION"
        exit 1
        ;;
esac

exit 0
