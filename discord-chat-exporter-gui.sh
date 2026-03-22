#!/bin/sh

export DISCORDCHATEXPORTER_ALLOW_AUTO_UPDATE=false
export DISCORDCHATEXPORTER_SETTINGS_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/DiscordChatExporter"

exec /usr/lib/discord-chat-exporter/DiscordChatExporter "$@"
