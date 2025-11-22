#!/bin/bash

# Script to auto-connect Korg Nanokontrol Studio via Bluetooth to virtual MIDI
# Triggered by udev on any Bluetooth device connection

DEVICE_NAME="nanoKONTROL Studio"

log() {
    logger -t "korg-nanokontrol" "$1"
}

# Log script execution for debugging
log "Script triggered by udev: DEVPATH=${DEVPATH:-unset} ACTION=${ACTION:-unset}"

# Check if our device is connected by searching for it by name
DEVICE_MAC=$(bluetoothctl devices | grep "$DEVICE_NAME" | awk '{print $2}')

if [ -z "$DEVICE_MAC" ]; then
    # Device not paired, exit silently
    exit 0
fi

# Exit early if this isn't our device or it's not connected
if ! bluetoothctl info "$DEVICE_MAC" | grep -q "Connected: yes"; then
    # Not connected, exit silently
    exit 0
fi

log "Korg NanoKontrol Studio detected as connected (MAC: $DEVICE_MAC)"

# Ensure snd-virmidi module is loaded for virtual MIDI ports with only 1 device
if ! lsmod | grep -q snd_virmidi; then
    log "Loading snd-virmidi module with 1 MIDI device"
    modprobe snd-virmidi midi_devs=1 || {
        log "Failed to load snd-virmidi module"
        exit 1
    }
else
    log "snd-virmidi module already loaded"
fi

# Wait for device to appear in ALSA MIDI
for i in {1..10}; do
    if aconnect -l | grep -q "nanoKONTROL Studio"; then
        log "NanoKontrol Studio found in ALSA MIDI"
        break
    fi
    log "Waiting for NanoKontrol Studio to appear in ALSA MIDI (attempt $i/10)"
    sleep 1
done

# Wait for ALSA MIDI ports to appear
sleep 0.5

# Find ALSA MIDI client IDs
KORG_CLIENT=$(aconnect -l | grep "nanoKONTROL Studio" | head -1 | sed 's/client \([0-9]*\):.*/\1/')
VIRTUAL_CLIENT=$(aconnect -l | grep "Virtual Raw MIDI" | head -1 | sed 's/client \([0-9]*\):.*/\1/')

if [ -z "$KORG_CLIENT" ]; then
    log "NanoKontrol Studio ALSA MIDI client not found"
    aconnect -l | logger -t "korg-nanokontrol"
    exit 1
fi

if [ -z "$VIRTUAL_CLIENT" ]; then
    log "VirMIDI ALSA MIDI client not found"
    aconnect -l | logger -t "korg-nanokontrol"
    exit 1
fi

log "Found NanoKontrol Studio client: $KORG_CLIENT, VirMIDI client: $VIRTUAL_CLIENT"

# Connect if not already connected
# NanoKontrol output -> VirMIDI input (device sends MIDI data to virtual port)
if ! aconnect -l | grep -q "$KORG_CLIENT:0.*$VIRTUAL_CLIENT:0"; then
    log "Connecting NanoKontrol output ($KORG_CLIENT:0) to VirMIDI input ($VIRTUAL_CLIENT:0)"
    aconnect "$KORG_CLIENT:0" "$VIRTUAL_CLIENT:0" || log "Failed to connect NanoKontrol -> VirMIDI"
else
    log "NanoKontrol -> VirMIDI connection already exists"
fi

# VirMIDI output -> NanoKontrol input (virtual port sends MIDI data to device)
if ! aconnect -l | grep -q "$VIRTUAL_CLIENT:0.*$KORG_CLIENT:0"; then
    log "Connecting VirMIDI output ($VIRTUAL_CLIENT:0) to NanoKontrol input ($KORG_CLIENT:0)"
    aconnect "$VIRTUAL_CLIENT:0" "$KORG_CLIENT:0" || log "Failed to connect VirMIDI -> NanoKontrol"
else
    log "VirMIDI -> NanoKontrol connection already exists"
fi

log "NanoKontrol Studio MIDI connection setup completed"
