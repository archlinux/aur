#!/bin/bash

# Arrays of file managers and their desktop files
fm_names=("Nautilus" "Thunar" "Dolphin" "Nemo" "PCManFM")
fm_desktops=("org.gnome.Nautilus.desktop" "thunar.desktop" "org.kde.dolphin.desktop" "nemo.desktop" "pcmanfm.desktop")

found_names=()
found_desktops=()

# Search for installed file managers
for i in "${!fm_desktops[@]}"; do
    desktop_file="${fm_desktops[$i]}"
    if [ -f "/usr/share/applications/$desktop_file" ] || [ -f "/usr/local/share/applications/$desktop_file" ]; then
        found_names+=("${fm_names[$i]}")
        found_desktops+=("$desktop_file")
    fi
done

count=${#found_desktops[@]}

# Handle results
if [ "$count" -eq 0 ]; then
    echo -e "\e[31m[-] No supported file manager found from the list.\e[0m"
    exit 1

elif [ "$count" -eq 1 ]; then
    selected_desktop="${found_desktops[0]}"
    echo -e "\e[32m[*] Only one file manager found: ${found_names[0]}\e[0m"

else
    echo -e "\e[33m[*] Multiple file managers found, please select one to set as default:\e[0m"
    for i in "${!found_names[@]}"; do
        echo "  $((i+1)) - ${found_names[$i]}"
    done

    echo ""
    read -p "Enter your choice (1-$count): " choice

    # Validate user input
    if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "$count" ]; then
        idx=$((choice-1))
        selected_desktop="${found_desktops[$idx]}"
    else
        echo -e "\e[31m[-] Invalid choice. Please run the script again.\e[0m"
        exit 1
    fi
fi

# Execute xdg-mime on the final choice
echo -e "\e[34m[*] Setting $selected_desktop as default...\e[0m"
xdg-mime default "$selected_desktop" inode/directory
xdg-mime default "$selected_desktop" x-scheme-handler/trash

echo -e "\e[32m[+] Successfully set as default!\e[0m"
exit 0