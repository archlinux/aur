#!/usr/bin/env bash

orphans=$(pacman -Qdtq)
orphan_count=$(echo "$orphans" | wc -l)
total_size=0

if [[ -n "$orphans" ]]; then
    echo -e "\033[1m==>\033[1;33m Found $orphan_count orphaned packages\033[0m"

    while read -r orphan; do
        size=$(LC_ALL=C.UTF-8 pacman -Qi "$orphan" | grep "Installed Size" | awk '{print $4, $5}')
        numeric_size=$(echo "$size" | awk '{print $1}')
        unit=$(echo "$size" | awk '{print $2}')

        if [[ "$unit" == "KiB" ]]; then
            numeric_size_in_mib=$(echo "scale=2; $numeric_size / 1024" | bc)
        else
            numeric_size_in_mib=$numeric_size
        fi
        total_size=$(echo "$total_size + $numeric_size_in_mib" | bc)
        printf "\033[1;37m%-20s\033[0m \033[1;34m%s\033[0m\n" "$orphan" "$size"
    done <<< "$orphans"

    echo -e "\033[1;37m--------------------------------\033[0m"
    echo -e "\033[1;37mTotal                \033[1;32m$(printf "%.2f" $total_size) MiB\033[0m"
else
    echo -e "\033[1m==>\033[1;32m No orphans found\033[0m"
fi
