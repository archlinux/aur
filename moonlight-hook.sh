#!/bin/bash

set -euo pipefail

declare -A discord_binary_location=(
    ["discord"]="/opt/discord/Discord"
    ["discord-canary"]="/opt/discord-canary/DiscordCanary"
    ["discord-ptb"]="/opt/discord-ptb/DiscordPTB"
)

while IFS= read -r package || [ -n "$package" ]; do
    moonlight-cli install stable
    moonlight-cli patch "${discord_binary_location[$package]}"
done
