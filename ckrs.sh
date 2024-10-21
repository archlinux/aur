#!/bin/bash

GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
NC='\033[0m' 

edit_config() {
    echo -e "${CYAN}Opening config.conf for editing...${NC}"
    nano config.conf 
}

while getopts "c" opt; do
    case $opt in
        c)
            edit_config
            exit 0
            ;;
        \?)
            echo -e "${RED}Invalid option: -$OPTARG${NC}" >&2
            exit 1
            ;;
    esac
done

CONFIG_FILE="config.conf"
if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "${RED}Configuration file not found! Please create a config.conf file.${NC}"
    exit 1
fi

source "$CONFIG_FILE"

if [ "$ENABLE_CPU" = true ]; then
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
fi

if [ "$ENABLE_RAM" = true ]; then
    mem_info=$(free -h | grep Mem)
    used_mem=$(echo $mem_info | awk '{print $3}')
    total_mem=$(echo $mem_info | awk '{print $2}')
fi

if [ "$ENABLE_SWAP" = true ]; then
    swap_info=$(free -h | grep Swap)
    used_swap=$(echo $swap_info | awk '{print $3}')
    total_swap=$(echo $swap_info | awk '{print $2}')
fi

if [ "$ENABLE_DISK" = true ]; then
    disk_usage=$(df -h / | awk 'NR==2 {print $3 "/" $2}')
fi

if [ "$ENABLE_UPTIME" = true ]; then
    uptime_info=$(uptime -p | sed 's/up //')
fi

if [ "$ENABLE_NETWORK" = true ]; then
    interface=$(ip -o -4 route show to default | awk '{print $5}')
    rx_bytes=$(cat /sys/class/net/$interface/statistics/rx_bytes 2>/dev/null || echo 0)
    tx_bytes=$(cat /sys/class/net/$interface/statistics/tx_bytes 2>/dev/null || echo 0)
fi

if [ "$ENABLE_LOAD_AVG" = true ]; then
    load_avg=$(cat /proc/loadavg | awk '{print $1, $2, $3}')
fi

if [ "$ENABLE_LOGGED_IN_USERS" = true ]; then
    logged_in_users=$(users | tr ' ' '\n' | sort -u | wc -l)
fi

if [ "$ENABLE_RUNNING_PROCESSES" = true ]; then
    running_processes=$(ps aux | wc -l)
fi

if [ "$ENABLE_DISK_IO" = true ]; then
    disk_io=$(awk '{print $3 " - Reads: " $4 " - Writes: " $8}' /proc/diskstats)
fi

if [ "$ENABLE_GPU" = true ]; then
    gpu_info=$(lspci | grep -i vga)
    if [[ $gpu_info == *"NVIDIA"* ]]; then
        gpu_usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader)
    elif [[ $gpu_info == *"AMD"* ]]; then
        gpu_usage="AMD GPU detected. Run 'radeontop' for usage."
    elif [[ $gpu_info == *"Intel"* ]]; then
        gpu_usage="Intel GPU detected. Run 'intel_gpu_top' for usage."
    elif [[ $gpu_info == *"VMware SVGA"* ]]; then
        gpu_usage="VMware SVGA II Adapter detected. Virtual GPU; metrics may be limited."
    else
        gpu_usage="No compatible GPU tools found."
    fi
fi

if [ "$ENABLE_KERNEL_VERSION" = true ]; then
    kernel_version=$(uname -r)
fi

if [ "$ENABLE_HOSTNAME" = true ]; then
    hostname_info=$(hostname 2>/dev/null || cat /etc/hostname)
fi

if [ "$ENABLE_TOP_CPU_PROCESSES" = true ]; then
    top_cpu_processes=$(ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n 6)
fi

if [ "$ENABLE_TOP_MEM_PROCESSES" = true ]; then
    top_mem_processes=$(ps -eo pid,user,%mem,comm --sort=-%mem | head -n 6)
fi

convert_bytes() {
    local bytes=$1
    if (( bytes < 1024 )); then
        echo "${bytes} B"
    elif (( bytes < 1048576 )); then
        echo "$((bytes / 1024)) KB"
    elif (( bytes < 1073741824 )); then
        echo "$((bytes / 1048576)) MB"
    else
        echo "$((bytes / 1073741824)) GB"
    fi
}

if [ "$ENABLE_NETWORK" = true ]; then
    rx_human=$(convert_bytes $rx_bytes)
    tx_human=$(convert_bytes $tx_bytes)
fi

echo -e "${CYAN}System Resource Usage:${NC}"
if [ "$ENABLE_CPU" = true ]; then
    echo -e "${GREEN}CPU Usage:${NC}      $cpu_usage"
fi
if [ "$ENABLE_RAM" = true ]; then
    echo -e "${YELLOW}RAM Usage:${NC}      $used_mem / $total_mem"
fi
if [ "$ENABLE_SWAP" = true ]; then
    echo -e "${YELLOW}Swap Usage:${NC}     $used_swap / $total_swap"
fi
if [ "$ENABLE_DISK" = true ]; then
    echo -e "${RED}Disk Usage:${NC}     $disk_usage"
fi
if [ "$ENABLE_UPTIME" = true ]; then
    echo -e "${MAGENTA}Uptime:${NC}         $uptime_info"
fi
if [ "$ENABLE_NETWORK" = true ]; then
    echo -e "${YELLOW}Network (RX/TX):${NC} ${rx_human} / ${tx_human}"
fi
if [ "$ENABLE_LOAD_AVG" = true ]; then
    echo -e "${CYAN}Load Average:${NC}   $load_avg"
fi
if [ "$ENABLE_RUNNING_PROCESSES" = true ]; then
    echo -e "${GREEN}Running Processes:${NC} $running_processes"
fi
if [ "$ENABLE_LOGGED_IN_USERS" = true ]; then
    echo -e "${MAGENTA}Unique Logged-in Users:${NC} $logged_in_users"
fi
if [ "$ENABLE_DISK_IO" = true ]; then
    echo -e "${YELLOW}Disk I/O Stats:${NC} $disk_io"
fi
if [ "$ENABLE_GPU" = true ]; then
    echo -e "${YELLOW}GPU Usage:${NC}      $gpu_usage"
fi
if [ "$ENABLE_KERNEL_VERSION" = true ]; then
    echo -e "${CYAN}Kernel Version:${NC} $kernel_version"
fi
if [ "$ENABLE_HOSTNAME" = true ]; then
    echo -e "${MAGENTA}Hostname:${NC}      $hostname_info"
fi
if [ "$ENABLE_TOP_CPU_PROCESSES" = true ]; then
    echo -e "${CYAN}Top 5 CPU Processes:${NC}"
    echo "$top_cpu_processes"
fi
if [ "$ENABLE_TOP_MEM_PROCESSES" = true ]; then
    echo -e "${CYAN}Top 5 Memory Processes:${NC}"
    echo "$top_mem_processes"
fi
if [ "$ENABLE_CURRENT_USERS" = true ]; then
    echo -e "${MAGENTA}Current Users:${NC}"
    echo "$current_users"
fi
echo -e "${CYAN}You can edit the config with: ${GREEN}ckrs -c${NC}"