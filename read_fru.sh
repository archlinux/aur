#!/bin/bash
echo "ThinkPad matherboard FRU reader. Verison 1.4."

if ! command -v i2cdump &> /dev/null; then
    echo "Error: i2cdump not found. Install i2c-tools."
    exit 1
fi

I2C_BUS=2
I2C_ADDR=0x50

if [ ! -e /dev/i2c-$I2C_BUS ]; then
    echo "Error: /dev/i2c-$I2C_BUS not found."
    exit 1
fi

DUMP=$(sudo i2cdump -y $I2C_BUS $I2C_ADDR b 2>/dev/null | awk '{for(i=2;i<=NF;i++) printf "%s ", $i}')

if [ -z "$DUMP" ]; then
    echo "Error: failed to read EEPROM data."
    exit 1
fi

ASCII=$(echo $DUMP | tr ' ' '\n' | while read H; do
    if [[ "$H" =~ ^[0-9A-Fa-f]{2}$ ]]; then
        printf "\\x$H"
    fi
done | tr -cd '[:print:]\n')

MODEL=$(echo "$ASCII" | grep -o 'B[0-9A-Z]*' | head -n1)
SERIAL=$(echo "$ASCII" | grep -o 'V[0-9A-Z]*' | head -n1)

echo "Model: $MODEL"
echo "Serial: $SERIAL"
