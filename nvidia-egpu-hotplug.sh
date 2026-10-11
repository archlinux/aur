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

# Unset or empty values mean enabled; explicitly set a value to 0 to disable it.
NVIDIA_EGPU_KILL_PROCESSES="${NVIDIA_EGPU_KILL_PROCESSES:-1}"
case "$NVIDIA_EGPU_KILL_PROCESSES" in
    0|1) ;;
    *)
        log "Invalid NVIDIA_EGPU_KILL_PROCESSES value '$NVIDIA_EGPU_KILL_PROCESSES'; keeping it disabled"
        NVIDIA_EGPU_KILL_PROCESSES=0
        ;;
esac

NVIDIA_EGPU_UNLOAD_MODULES="${NVIDIA_EGPU_UNLOAD_MODULES:-1}"
case "$NVIDIA_EGPU_UNLOAD_MODULES" in
    0|1) ;;
    *)
        log "Invalid NVIDIA_EGPU_UNLOAD_MODULES value '$NVIDIA_EGPU_UNLOAD_MODULES'; keeping module unloading disabled"
        NVIDIA_EGPU_UNLOAD_MODULES=0
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
NVIDIA_MODULES_TO_UNLOAD=(nvidia_uvm nvidia_drm nvidia_modeset nvidia_peermem nvidia_nvlink nvidia)
NVIDIA_EGPU_STATE_DIR=/run/nvidia-egpu-hotplug
NVIDIA_EGPU_GPU_STATE_DIR=$NVIDIA_EGPU_STATE_DIR/gpus
NVIDIA_EGPU_CLEANUP_LOCK_FILE=$NVIDIA_EGPU_STATE_DIR/cleanup.lock

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
    local count=0 vendor class dir quiet="${1:-0}"
    for dir in /sys/bus/pci/devices/*; do
        if [ -f "$dir/vendor" ] && [ -f "$dir/class" ]; then
            vendor=$(cat "$dir/vendor" 2>/dev/null)
            class=$(cat "$dir/class" 2>/dev/null)
            # Check for NVIDIA (0x10de) and display class (0x0300xx or 0x0302xx)
            if [ "$vendor" = "0x10de" ]; then
                case "$class" in
                    0x030000|0x030200|0x030800)
                        count=$((count + 1))
                        if [ "$quiet" != "1" ]; then
                            log "Found NVIDIA GPU at $dir (class=$class)"
                        fi
                        ;;
                    *)
                        ;;
                esac
            fi
        fi
    done
    if [ "$quiet" != "1" ]; then
        log "NVIDIA GPUs currently present: $count"
    fi
    echo "$count"
}

gpu_external_status() {
    local bdf="$1" information="/proc/driver/nvidia/gpus/$1/information"

    [[ "$bdf" =~ ^[[:xdigit:]]{4}:[[:xdigit:]]{2}:[[:xdigit:]]{2}\.[0-7]$ ]] || return 1
    [ -r "$information" ] || return 1
    awk -F: '
        $1 ~ /^[[:space:]]*External GPU[[:space:]]*$/ {
            value = $2
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", value)
            print value
            found = 1
            exit
        }
        END { if (!found) exit 1 }
    ' "$information"
}

gpu_device_minor() {
    local bdf="$1" information="/proc/driver/nvidia/gpus/$1/information"

    [[ "$bdf" =~ ^[[:xdigit:]]{4}:[[:xdigit:]]{2}:[[:xdigit:]]{2}\.[0-7]$ ]] || return 1
    [ -r "$information" ] || return 1
    awk -F: '
        $1 ~ /^[[:space:]]*Device Minor[[:space:]]*$/ {
            value = $2
            gsub(/[[:space:]]/, "", value)
            if (value ~ /^[0-9]+$/) {
                print value
                found = 1
                exit
            }
        }
        END { if (!found) exit 1 }
    ' "$information"
}

gpu_drm_nodes() {
    local bdf="$1" pci_path="/sys/bus/pci/devices/$1" pci_realpath drm_path node device_realpath

    [[ "$bdf" =~ ^[[:xdigit:]]{4}:[[:xdigit:]]{2}:[[:xdigit:]]{2}\.[0-7]$ ]] || return 1
    [ -e "$pci_path" ] || return 1
    pci_realpath=$(readlink -f -- "$pci_path") || return 1

    for drm_path in /sys/class/drm/renderD[0-9]*; do
        [ -e "$drm_path/device" ] || continue
        node=${drm_path##*/}
        [[ "$node" =~ ^renderD[0-9]+$ ]] || continue
        device_realpath=$(readlink -f -- "$drm_path/device") || continue
        [ "$device_realpath" = "$pci_realpath" ] && printf '%s\n' "$node"
    done | paste -sd, -
}

record_external_gpu() {
    local bdf="$1" external_status minor drm_nodes record_path

    if [[ ! "$bdf" =~ ^[[:xdigit:]]{4}:[[:xdigit:]]{2}:[[:xdigit:]]{2}\.[0-7]$ ]]; then
        log "Cannot record NVIDIA GPU: invalid BDF"
        return 1
    fi

    external_status=$(gpu_external_status "$bdf") || {
        log "Cannot read NVIDIA external-GPU status for $bdf; not tracking it for cleanup"
        return 1
    }
    case "$external_status" in
        Yes) minor=$(gpu_device_minor "$bdf") || minor="" ;;
        No) minor="" ;;
        *)
            log "Unexpected NVIDIA external-GPU status '$external_status' for $bdf; not tracking it"
            return 1
            ;;
    esac

    if [ "$external_status" = "Yes" ] && [[ ! "$minor" =~ ^[0-9]+$ ]]; then
        log "Cannot map NVIDIA GPU $bdf to its device minor"
        return 1
    fi
    if [ "$external_status" = "Yes" ]; then
        drm_nodes=$(gpu_drm_nodes "$bdf") || drm_nodes=""
    fi

    mkdir -p "$NVIDIA_EGPU_GPU_STATE_DIR"
    record_path=$NVIDIA_EGPU_GPU_STATE_DIR/$bdf
    if [ "$external_status" = "No" ]; then
        rm -f "$record_path"
        log "NVIDIA GPU $bdf is classified as internal; cleared any stale eGPU record"
        return 0
    fi

    if ! printf '%s %s\n' "$minor" "$drm_nodes" > "$record_path.tmp.$$" ||
       ! mv -f "$record_path.tmp.$$" "$record_path"; then
        rm -f "$record_path.tmp.$$"
        log "Failed to update external NVIDIA GPU record for $bdf"
        return 1
    fi

    log "Recorded external NVIDIA GPU $bdf (device minor $minor; render nodes: ${drm_nodes:-none})"
}

gpu_bdf_present() {
    local bdf="$1" path="/sys/bus/pci/devices/$1" vendor class

    [ -d "$path" ] || return 1
    vendor=$(cat "$path/vendor" 2>/dev/null) || return 1
    class=$(cat "$path/class" 2>/dev/null) || return 1
    [ "$vendor" = "0x10de" ] || return 1
    case "$class" in
        0x030000|0x030200|0x030800) return 0 ;;
        *) return 1 ;;
    esac
}

gpu_record_lines() {
    local record bdf first second minor drm_nodes

    for record in "$NVIDIA_EGPU_GPU_STATE_DIR"/*; do
        [ -f "$record" ] || continue
        bdf=${record##*/}
        read -r first second < "$record" || continue
        [[ "$bdf" =~ ^[[:xdigit:]]{4}:[[:xdigit:]]{2}:[[:xdigit:]]{2}\.[0-7]$ ]] || continue
        if [[ "$second" =~ ^[0-9]+$ ]]; then
            # Older records stored a udev sequence number followed by the GPU minor.
            minor="$second"
            drm_nodes=""
        elif [[ "$first" =~ ^[0-9]+$ ]]; then
            minor="$first"
            drm_nodes="$second"
        else
            continue
        fi
        [[ "$minor" =~ ^[0-9]+$ ]] || continue
        printf '%s %s %s\n' "$bdf" "$minor" "$drm_nodes"
    done
}

missing_gpu_record_lines() {
    local bdf minor drm_nodes

    while read -r bdf minor drm_nodes; do
        [ -n "$bdf" ] || continue
        if ! gpu_bdf_present "$bdf"; then
            printf '%s %s %s\n' "$bdf" "$minor" "$drm_nodes"
        fi
    done < <(gpu_record_lines)
}

gpu_minor_assigned_to_other_bdf() {
    local target_bdf="$1" target_minor="$2" information bdf minor

    for information in /proc/driver/nvidia/gpus/*/information; do
        [ -r "$information" ] || continue
        bdf=${information%/information}
        bdf=${bdf##*/}
        [ "$bdf" = "$target_bdf" ] && continue
        minor=$(awk -F: '
            $1 ~ /^[[:space:]]*Device Minor[[:space:]]*$/ {
                value = $2
                gsub(/[[:space:]]/, "", value)
                if (value ~ /^[0-9]+$/) {
                    print value
                    found = 1
                    exit
                }
            }
            END { if (!found) exit 1 }
        ' "$information") || continue
        if [ "$minor" = "$target_minor" ]; then
            log "Device minor $target_minor now belongs to NVIDIA GPU $bdf; skipping stale target $target_bdf"
            return 0
        fi
    done

    return 1
}

# Refuse to target a recorded DRM node if Linux has reassigned it to another PCI device.
drm_node_assigned_to_other_bdf() {
    local target_bdf="$1" node="$2" device_path="/sys/class/drm/$2/device" device_realpath current_device

    [[ "$node" =~ ^renderD[0-9]+$ ]] || return 0
    [ -e "$device_path" ] || return 1
    if ! device_realpath=$(readlink -f -- "$device_path"); then
        log "Cannot verify current owner of DRM node $node; skipping it"
        return 0
    fi
    current_device=${device_realpath##*/}
    [ "$current_device" = "$target_bdf" ] && return 1

    log "DRM node $node now belongs to another device; skipping stale target $target_bdf"
    return 0
}

# Return target-only GPU clients. Leave a process alone if it also has a
# non-target NVIDIA GPU node open, such as an internal GPU that remains attached.
get_nvidia_pids_for_targets() {
    local quiet="$1"
    shift
    local minor node fd link pid other_fd fd_minor fd_node has_target has_other found=0 protected=0 target_list=""
    local drm_path drm_vendor
    local -a requested_minors=() requested_drm_nodes=()
    local -A target_minors=() target_drm_nodes=() active_nvidia_drm_nodes=() candidates=()
    local -a pids=()

    while [ "$#" -gt 0 ] && [ "$1" != "--" ]; do
        requested_minors+=("$1")
        shift
    done
    [ "$#" -gt 0 ] && shift
    requested_drm_nodes=("$@")

    for minor in "${requested_minors[@]}"; do
        [[ "$minor" =~ ^[0-9]+$ ]] || continue
        target_minors["$minor"]=1
        target_list+=" /dev/nvidia$minor"
    done
    for node in "${requested_drm_nodes[@]}"; do
        [[ "$node" =~ ^renderD[0-9]+$ ]] || continue
        target_drm_nodes["$node"]=1
        target_list+=" /dev/dri/$node"
    done
    [ "${#target_minors[@]}" -gt 0 ] || [ "${#target_drm_nodes[@]}" -gt 0 ] || return 1

    for drm_path in /sys/class/drm/renderD[0-9]*; do
        [ -r "$drm_path/device/vendor" ] || continue
        node=${drm_path##*/}
        [[ "$node" =~ ^renderD[0-9]+$ ]] || continue
        drm_vendor=$(cat "$drm_path/device/vendor" 2>/dev/null) || continue
        [ "$drm_vendor" = "0x10de" ] || continue
        active_nvidia_drm_nodes["$node"]=1
    done

    for fd in /proc/[0-9]*/fd/*; do
        link=$(readlink "$fd" 2>/dev/null) || continue
        if [[ "$link" =~ ^/dev/nvidia([0-9]+)([[:space:]]+\(deleted\))?$ ]] &&
           [[ -n "${target_minors[${BASH_REMATCH[1]}]+yes}" ]]; then
            pid="${fd#/proc/}"
            pid="${pid%%/*}"
            candidates["$pid"]=1
        elif [[ "$link" =~ ^/dev/dri/(renderD[0-9]+)([[:space:]]+\(deleted\))?$ ]] &&
             [[ -n "${target_drm_nodes[${BASH_REMATCH[1]}]+yes}" ]]; then
            pid="${fd#/proc/}"
            pid="${pid%%/*}"
            candidates["$pid"]=1
        fi
    done

    for pid in "${!candidates[@]}"; do
        has_target=0
        has_other=0
        for other_fd in /proc/$pid/fd/*; do
            link=$(readlink "$other_fd" 2>/dev/null) || continue
            if [[ "$link" =~ ^/dev/nvidia([0-9]+)([[:space:]]+\(deleted\))?$ ]]; then
                fd_minor=${BASH_REMATCH[1]}
                if [[ -n "${target_minors[$fd_minor]+yes}" ]]; then
                    has_target=1
                else
                    has_other=1
                fi
            elif [[ "$link" =~ ^/dev/dri/(renderD[0-9]+)([[:space:]]+\(deleted\))?$ ]]; then
                fd_node=${BASH_REMATCH[1]}
                if [[ -n "${target_drm_nodes[$fd_node]+yes}" ]]; then
                    has_target=1
                fi
                if [[ -n "${active_nvidia_drm_nodes[$fd_node]+yes}" ]]; then
                    has_other=1
                fi
            fi
        done
        [ "$has_target" -eq 1 ] || continue
        found=1
        if [ "$has_other" -eq 1 ]; then
            protected=1
            [ "$quiet" = "1" ] || log "Leaving PID $pid alone because it also has an active NVIDIA GPU node open"
        else
            pids+=("$pid")
        fi
    done

    if [ "$quiet" != "1" ]; then
        if [ "$found" -eq 0 ]; then
            log "No processes hold target NVIDIA GPU node(s):${target_list}"
        elif [ "${#pids[@]}" -eq 0 ] && [ "$protected" -eq 1 ]; then
            log "All clients of the removed GPU(s) also hold an active NVIDIA GPU node; leaving them alive"
        fi
    fi

    if [ "${#pids[@]}" -gt 0 ]; then
        printf '%s\n' "${pids[@]}" | sort -nu | paste -sd' ' -
    fi
}

wait_for_gpu_clients_to_release() {
    local timeout="$1"
    shift
    local elapsed pids

    for ((elapsed = 0; elapsed < timeout; elapsed++)); do
        pids=$(get_nvidia_pids_for_targets 1 "$@")
        [ -z "$pids" ] && return 0
        sleep 1
    done
    get_nvidia_pids_for_targets 1 "$@"
}

terminate_nvidia_processes() {
    local -a target_minors=() target_drm_nodes=()
    local pids remaining pid current_pids
    local -A term_sent=()

    while [ "$#" -gt 0 ] && [ "$1" != "--" ]; do
        target_minors+=("$1")
        shift
    done
    [ "$#" -gt 0 ] && shift
    target_drm_nodes=("$@")

    pids=$(get_nvidia_pids_for_targets 0 "${target_minors[@]}" -- "${target_drm_nodes[@]}")
    [ -n "$pids" ] || return

    log "Sending SIGTERM to processes using removed eGPU device nodes: $pids"
    for pid in $pids; do
        if kill -TERM "$pid" 2>/dev/null; then
            term_sent["$pid"]=1
        fi
    done

    remaining=$(wait_for_gpu_clients_to_release 5 "${target_minors[@]}" -- "${target_drm_nodes[@]}")
    pids=""
    for pid in $remaining; do
        [[ -n "${term_sent[$pid]+yes}" ]] && pids+=" $pid"
    done
    if [ -z "$pids" ]; then
        if [ -n "$remaining" ]; then
            log "New or unsignaled GPU clients still hold removed device node(s); leaving them alive"
        else
            log "eGPU clients released their device references after SIGTERM"
        fi
        return
    fi

    current_pids=$(get_nvidia_pids_for_targets 1 "${target_minors[@]}" -- "${target_drm_nodes[@]}")
    remaining=""
    for pid in $current_pids; do
        [[ -n "${term_sent[$pid]+yes}" ]] && remaining+=" $pid"
    done
    if [ -z "$remaining" ]; then
        log "eGPU clients released their device references after SIGTERM"
        return
    fi

    log "Processes still hold removed eGPU device nodes after SIGTERM: $remaining; sending SIGKILL"
    for pid in $remaining; do
        kill -KILL "$pid" 2>/dev/null
    done

    log "Waiting up to 5 seconds for killed eGPU clients to release device references"
    pids=$(wait_for_gpu_clients_to_release 5 "${target_minors[@]}" -- "${target_drm_nodes[@]}")
    if [ -n "$pids" ]; then
        log "Processes still hold removed eGPU device node(s) after SIGKILL: $pids"
    else
        log "No target-only processes hold removed eGPU device node(s) after force-kill"
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
        for mod in "${NVIDIA_MODULES_TO_UNLOAD[@]}"; do
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
    for mod in "${NVIDIA_MODULES_TO_UNLOAD[@]}"; do
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
    local pids remaining waited=0 wait_limit=30 missing_records
    local bdf minor drm_nodes drm_node waited_count=0 unit_device="${DEVICE:-unknown}"
    local -a target_bdfs=() target_minors=() target_drm_nodes=() recorded_drm_nodes=()
    local -A seen_minors=() seen_drm_nodes=()

    # Unset or empty values default to 1 above. Skip only if both actions were disabled.
    if [ "$NVIDIA_EGPU_UNLOAD_MODULES" = "0" ] &&
       [ "$NVIDIA_EGPU_KILL_PROCESSES" = "0" ]; then
        log "Module unloading and process termination are disabled; skipping cleanup"
        return
    fi

    mkdir -p "$NVIDIA_EGPU_STATE_DIR"
    exec 8>"$NVIDIA_EGPU_CLEANUP_LOCK_FILE"
    flock -x 8 || {
        log "Could not acquire cleanup lock; leaving NVIDIA processes and modules alone"
        return 1
    }

    log "Starting eGPU cleanup for Thunderbolt device $unit_device; waiting 5 seconds for PCI removal to settle"
    sleep 5

    if [ -n "$(gpu_record_lines)" ]; then
        log "Checking all recorded external NVIDIA GPUs for removal"
        while [ "$waited" -lt "$wait_limit" ]; do
            missing_records=$(missing_gpu_record_lines)
            [ -n "$missing_records" ] && break
            sleep 1
            waited=$((waited + 1))
            if [ "$((waited % 5))" -eq 0 ]; then
                log "No recorded external NVIDIA GPU has disappeared after ${waited}s"
            fi
        done
        missing_records=$(missing_gpu_record_lines)
        if [ -z "$missing_records" ]; then
            log "No recorded external NVIDIA GPU disappeared within ${wait_limit}s; leaving processes and modules alone"
            return
        fi

        while read -r bdf minor drm_nodes; do
            [ -n "$bdf" ] || continue
            if gpu_bdf_present "$bdf"; then
                log "External NVIDIA GPU $bdf reappeared; skipping cleanup for it"
                continue
            fi

            log "External NVIDIA GPU $bdf disappeared from PCI sysfs (device minor $minor; render nodes: ${drm_nodes:-none})"
            if ! gpu_minor_assigned_to_other_bdf "$bdf" "$minor"; then
                if [[ -z "${seen_minors[$minor]+yes}" ]]; then
                    target_minors+=("$minor")
                    seen_minors["$minor"]=1
                fi
            fi

            target_bdfs+=("$bdf")
            recorded_drm_nodes=()
            IFS=, read -r -a recorded_drm_nodes <<< "$drm_nodes"
            for drm_node in "${recorded_drm_nodes[@]}"; do
                [[ "$drm_node" =~ ^renderD[0-9]+$ ]] || continue
                if drm_node_assigned_to_other_bdf "$bdf" "$drm_node"; then
                    continue
                fi
                if [[ -z "${seen_drm_nodes[$drm_node]+yes}" ]]; then
                    target_drm_nodes+=("$drm_node")
                    seen_drm_nodes["$drm_node"]=1
                fi
            done
        done <<< "$missing_records"
    else
        log "No external NVIDIA GPU record is available; process termination cannot target a GPU safely"
        if [ "$NVIDIA_EGPU_UNLOAD_MODULES" = "1" ]; then
            remaining=$(count_nvidia_gpus)
            while [ "$remaining" -gt 0 ] && [ "$waited_count" -lt "$wait_limit" ]; do
                sleep 1
                waited_count=$((waited_count + 1))
                remaining=$(count_nvidia_gpus 1)
                if [ "$remaining" -gt 0 ] && [ "$((waited_count % 5))" -eq 0 ]; then
                    log "NVIDIA GPUs are still present after ${waited_count}s"
                fi
            done
            if [ "$remaining" -gt 0 ]; then
                log "NVIDIA GPUs remained present after ${wait_limit}s; keeping modules loaded"
                return
            fi
        else
            log "Module unloading is disabled; cleanup is complete"
            return
        fi
    fi

    if [ "${#target_minors[@]}" -gt 0 ] || [ "${#target_drm_nodes[@]}" -gt 0 ]; then
        if [ "$NVIDIA_EGPU_KILL_PROCESSES" = "1" ]; then
            log "Targeting removed eGPU(s): ${target_bdfs[*]}"
            terminate_nvidia_processes "${target_minors[@]}" -- "${target_drm_nodes[@]}"
        else
            pids=$(get_nvidia_pids_for_targets 0 "${target_minors[@]}" -- "${target_drm_nodes[@]}")
            if [ -n "$pids" ]; then
                log "Process termination is disabled; clients still use removed eGPU device nodes: $pids"
            fi
        fi
    elif [ "$NVIDIA_EGPU_KILL_PROCESSES" = "1" ] && [ -n "$missing_records" ]; then
        log "No safe NVIDIA device-minor target is available; skipping process termination"
    fi

    if [ "$NVIDIA_EGPU_UNLOAD_MODULES" = "1" ]; then
        unload_nvidia_modules

        if lsmod | grep -Eq '^(nvidia|nvidia_uvm|nvidia_drm|nvidia_modeset|nvidia_peermem|nvidia_nvlink) '; then
            log "NVIDIA modules remain loaded; deferring PCI bridge restoration"
        else
            restore_configured_bridge
        fi
    else
        log "Module unloading is disabled; process cleanup is complete"
    fi
}

# Load NVIDIA modules
load_nvidia_modules() {
    local mod

    log "Loading NVIDIA modules..."
    for mod in nvidia nvidia_modeset nvidia_drm nvidia_uvm; do
        if ! run_logged modprobe modprobe "$mod"; then
            log "Failed to load $mod; stopping module load sequence"
            return 1
        fi
    done
    log "Module load complete"
}

case "$ACTION" in
    remove)
        remove_event_id="$3"
        if [[ ! "$remove_event_id" =~ ^[0-9]+$ ]]; then
            remove_event_id="$BASHPID"
            log "Thunderbolt remove event has no valid sequence number; using worker ID $remove_event_id"
        fi
        if [ "$NVIDIA_EGPU_UNLOAD_MODULES" = "0" ] &&
           [ "$NVIDIA_EGPU_KILL_PROCESSES" = "0" ]; then
            log "Thunderbolt remove event received: $DEVICE; module unloading and process termination are disabled"
        else
            log "Thunderbolt device removed: $DEVICE; scheduling eGPU cleanup"
            # Keep a distinct worker for each event; the cleanup lock serializes them.
            unit_name="nvidia-egpu-unload-$remove_event_id"
            if run_logged systemd-run systemd-run --quiet --no-block --collect --unit="$unit_name" \
                --setenv="NVIDIA_EGPU_KILL_PROCESSES=$NVIDIA_EGPU_KILL_PROCESSES" \
                --setenv="NVIDIA_EGPU_UNLOAD_MODULES=$NVIDIA_EGPU_UNLOAD_MODULES" \
                --setenv="NVIDIA_EGPU_DISABLE_BRIDGE=$NVIDIA_EGPU_DISABLE_BRIDGE" \
                /usr/lib/nvidia-egpu/nvidia-egpu-hotplug.sh unload "$DEVICE"; then
                log "Started $unit_name.service"
            else
                log "Failed to start eGPU cleanup worker"
            fi
        fi
        ;;

    unload)
        delayed_unload
        ;;
        
    add)
        log "GPU added: $DEVICE"
        # Apply the optional bridge workaround only before the first module load.
        if ! lsmod | grep -q "^nvidia "; then
            if [ -n "$NVIDIA_EGPU_DISABLE_BRIDGE" ]; then
                disable_configured_bridge "$DEVICE" || \
                    log "Continuing without the configured PCI bridge workaround"
            fi
        elif [ -n "$NVIDIA_EGPU_DISABLE_BRIDGE" ]; then
            log "NVIDIA modules are already loaded; skipping PCI bridge workaround"
        fi

        # modprobe is idempotent; ensure auxiliary modules are present as well.
        load_status=0
        load_nvidia_modules || load_status=$?
        if [ "$BRIDGE_REMOVED_FOR_REBAR" -eq 1 ]; then
            restore_configured_bridge
        fi
        if [ "$load_status" -ne 0 ]; then
            log "NVIDIA module load failed for GPU $DEVICE"
            exit 1
        fi
        record_external_gpu "$DEVICE" || \
            log "External NVIDIA GPU tracking is unavailable; process termination will be skipped on removal"
        ;;
        
    *)
        log "Unknown action: $ACTION"
        exit 1
        ;;
esac

exit 0
