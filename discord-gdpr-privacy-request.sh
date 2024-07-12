#!/bin/sh

CONFIG_FILE="$HOME/.config/discord-gdpr-privacy-request"

notify() {
    printf "%s\n" "$1"
}

check_and_notify() {
    [ -t 1 ] && notify "$1" || notify-send "Discord GDPR Privacy Request" "$1"
}

delay_execution() {
    # TODO: Do not exit after first 50043 when multiple tokens exist and actually make the delay work
    check_and_notify "Request already made within 30 days. (Received 50043)"
    check_and_notify "Exiting now. You may want to contribute to make this script better."
    exit 0
}

# Check if config file exists and is not empty
[ -f "$CONFIG_FILE" ] || { check_and_notify "Config file not found: $CONFIG_FILE"; exit 1; }
TOKENS=$(cat "$CONFIG_FILE")
[ -n "$TOKENS" ] || { check_and_notify "The config file is empty."; exit 1; }

# Loop through each token in the config file
echo "$TOKENS" | while IFS= read -r TOKEN; do
    RESPONSE=$(curl -s -H "Authorization: $TOKEN" https://discord.com/api/v9/users/@me)
    USERID=$(echo "$RESPONSE" | awk -F'"' '/"id":/ { print $4 }')
    
    # If USERID is not null and not empty
    [ -n "$USERID" ] && [ "$USERID" != "null" ] && check_and_notify "Request sent for $USERID"
    
    # Send the GDPR privacy request to Discord
    RESPONSE=$(curl -s 'https://discord.com/api/v9/users/@me/harvest' -X POST \
        -H 'Accept: */*' -H 'Content-Type: application/json' \
        -H "Authorization: $TOKEN" \
        --data-raw '{"backends":[]}')
    printf "\n"

    # Check if privacy request was already made (request is possible every 30 days)
    echo "$RESPONSE" | grep -q '"code": 50043' && delay_execution
done
