#!/bin/bash

# Получение информации о системе
CPU=$(grep -m 1 'model name' /proc/cpuinfo | cut -d ':' -f 2 | sed 's/^[ \t]*//')
GPU=$(lspci | grep -i vga | cut -d ':' -f 3 | sed 's/^[ \t]*//')
IP_ADDRESS=$(hostname -I | awk '{print $1}')
OS=$(lsb_release -d | cut -d ':' -f 2 | sed 's/^[ \t]*//')
DISPLAY=$(xrandr | grep ' connected' | awk '{print $3}')
TERMINAL=$(echo $TERM)
RAM=$(free -h | awk '/Mem:/ {print $3 "/" $2}')

# Определение цвета для ASCII-арта
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

# ASCII-логотип
echo -e "${ORANGE}"
echo "        ░ ░░░░                            ░░░░░░"
echo "        ░░░░░░                            ░░░░░░"
echo "        ░░░▓▓░░░░   ░░░░░░░░░░░░░░░░░  ░░░░▒▒░░"
echo "         ░░▓▓▓▓▓▓░░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒▒░░"
echo "           ░▓▓▓▓▓▓▓▓▓░░░▒▒▒▒▒▒▒▒░░░▒▒▒▒▒▒▒▒▒▒░"
echo "           ░░▓▓▓▓▓▓▓▓▓▓▒░░▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒░░"
echo "        ░░░▒▓▓░░░░░░░░░▓▓░░▒▒░░▒▒░░░░░░░░░▒▒░░░░"
echo "        ░░▓▓▓░   ░██░░░░▓▓░░░▒▒▒░░▒░██░░░░░▒▒▒░░"
echo "        ░░▓▓░░ ░░██░░░█░░▓▓░░▒▒░░▒░░░██░  ░░▒▒░"
echo "        ░░▓▓░  ░░███▓█▓░░▓▓░░▒▒░░██▓███░░ ░░▒▒░░"
echo "        ░░▓▓░░   ░░█▓░░░░▓▓░░▒▒░░░░▓█░░   ░░▒▒░░"
echo "         ░░▓▓░░░░  ░░░░▒▓▓░░░░▒▒░░░░░░  ░░░░▒▒░░░"
echo "        ░░░░▓▓▓▓░░░░░▓▓▓▒░░▒▒░░▒▒▒▒░░░░░▒▒▒▒░░░░"
echo "           ░░░░▓▓▓▓▓▓▒░░░░░▒▒░░░░░▒▒▒▒▒▒▒░░░░"
echo "           ░░░▒▒░░░░░▒▒▒▒▒░░░░▒▒▒▒▒░░░░░▒▒░░░"
echo "           ░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░"
echo "              ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░"
echo "                 ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░"
echo "                 ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░"
echo "                   ░░░░▒▒▒▒▒▒▒▒▒▒░░░░"
echo "                      ░░░▒▒▒▒▒▒░░░"
echo "                      ░░░░░▒▒░░░░░"
echo "                         ░░░░░░"
echo -e "${NC}"

# Вывод информации о системе
echo "===== INFO:"
echo "CPU - $CPU"
echo "GPU - $GPU"
echo "IP Address - $IP_ADDRESS"
echo "OS - $OS"
echo "Display - $DISPLAY"
echo "Terminal - $TERMINAL"
echo "RAM - $RAM"
echo "YEST EXPLOIT REDHAT FORTUNAnetSMARTboost? - DAAA"
