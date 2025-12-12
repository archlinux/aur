#!/bin/bash
# NVIDIA eGPU hotplug handler script
# Handles module loading/unloading for Thunderbolt eGPU hotplug

LOGFILE="/var/log/nvidia-egpu-hotplug.log"
ACTION="$1"
DEVICE="$2"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$ACTION] $*" >> "$LOGFILE"
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

# Wait for processes to exit, then unload modules
delayed_unload() {
    log "Starting delayed module unload sequence..."
    
    # Wait for driver to finish surprise removal handling
    sleep 5
    
    # Get processes using nvidia (without fuser - it triggers RM calls)
    local pids=$(get_nvidia_pids)
    if [ -n "$pids" ]; then
        log "Sending SIGTERM to processes using NVIDIA: $pids"
        for pid in $pids; do
            kill -TERM "$pid" 2>/dev/null
        done
        
        # Wait up to 10 seconds for processes to exit
        local waited=0
        while [ $waited -lt 10 ]; do
            sleep 1
            waited=$((waited + 1))
            pids=$(get_nvidia_pids)
            if [ -z "$pids" ]; then
                log "All NVIDIA processes exited"
                break
            fi
            log "Waiting for processes to exit... ($waited/10s)"
        done
        
        # If still running after 10s, force kill
        pids=$(get_nvidia_pids)
        if [ -n "$pids" ]; then
            log "Force killing remaining processes: $pids"
            for pid in $pids; do
                kill -KILL "$pid" 2>/dev/null
            done
            sleep 2
        fi
    else
        log "No processes using NVIDIA devices"
    fi
    
    # Now unload modules
    log "Unloading NVIDIA modules..."
    for mod in nvidia_uvm nvidia_drm nvidia_modeset nvidia; do
        if lsmod | grep -q "^$mod "; then
            log "Unloading $mod..."
            modprobe -r "$mod" 2>> "$LOGFILE" || log "Failed to unload $mod"
        fi
    done
    
    log "Module unload sequence complete"
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
            systemd-run --no-block --unit=nvidia-egpu-unload-$$ /bin/bash -c "
                exec >> $LOGFILE 2>&1
                echo \"\$(date '+%Y-%m-%d %H:%M:%S') [unload] Delayed unload started via systemd\"
                sleep 1
                
                # Check for processes using nvidia
                for fd_dir in /proc/[0-9]*/fd; do
                    pid=\$(echo \"\$fd_dir\" | cut -d'/' -f3)
                    if ls -la \"\$fd_dir\" 2>/dev/null | grep -q '/dev/nvidia'; then
                        echo \"\$(date '+%Y-%m-%d %H:%M:%S') [unload] Sending SIGTERM to \$pid\"
                        kill -TERM \"\$pid\" 2>/dev/null
                    fi
                done
                
                sleep 2
                
                # Force kill if still running
                for fd_dir in /proc/[0-9]*/fd; do
                    pid=\$(echo \"\$fd_dir\" | cut -d'/' -f3)
                    if ls -la \"\$fd_dir\" 2>/dev/null | grep -q '/dev/nvidia'; then
                        echo \"\$(date '+%Y-%m-%d %H:%M:%S') [unload] Sending SIGKILL to \$pid\"
                        kill -KILL \"\$pid\" 2>/dev/null
                    fi
                done
                
                sleep 1
                
                # Check if GPU came back (rapid replug scenario)
                gpu_back=0
                for dir in /sys/bus/pci/devices/*; do
                    if [ -f \"\$dir/vendor\" ]; then
                        vendor=\$(cat \"\$dir/vendor\" 2>/dev/null)
                        class=\$(cat \"\$dir/class\" 2>/dev/null)
                        if [ \"\$vendor\" = \"0x10de\" ]; then
                            case \"\$class\" in
                                0x030000|0x030200|0x030800) gpu_back=1 ;;
                            esac
                        fi
                    fi
                done
                
                if [ \$gpu_back -eq 1 ]; then
                    echo \"\$(date '+%Y-%m-%d %H:%M:%S') [unload] GPU detected again, aborting unload\"
                    exit 0
                fi
                
                # Unload modules
                for mod in nvidia_uvm nvidia_drm nvidia_modeset nvidia; do
                    if lsmod | grep -q \"^\$mod \"; then
                        echo \"\$(date '+%Y-%m-%d %H:%M:%S') [unload] Unloading \$mod...\"
                        modprobe -r \"\$mod\" 2>&1 || echo \"\$(date '+%Y-%m-%d %H:%M:%S') [unload] Failed to unload \$mod\"
                    fi
                done
                
                echo \"\$(date '+%Y-%m-%d %H:%M:%S') [unload] Module unload sequence complete\"
            "
            log "Spawned nvidia-egpu-unload-$$ via systemd-run"
        else
            log "Other NVIDIA GPUs still present, keeping modules loaded"
        fi
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
