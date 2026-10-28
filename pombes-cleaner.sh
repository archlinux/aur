
#!/bin/bash

# Pombes System Cleaner
# Ein kleines Tool, um den Pacman-Cache aufzuräumen.

# Zeigt den freien Speicherplatz und die Größe des Paket-Caches an

show_disk() {
    echo
    echo "Speicherplatz:"
    df -h /

    echo
    echo "Größe des Pacman-Caches:"
    sudo du -sh /var/cache/pacman/pkg/
}


# Zeigt an, welche alten Paketdateien gelöscht werden könnten
show_old_packages() {
    echo
    echo "Diese alten Pakete können entfernt werden:"
    paccache -dv -k 3
}

# Entfernt alte Pakete, behält aber die letzten 3 Versionen
clean_cache() {
    echo
    echo "Alte Paketdateien werden aufgeräumt."
    echo "Die letzten 3 Versionen bleiben erhalten."
    echo

    read -r -p "Möchtest du fortfahren? (j/n): " answer

    if [[ "$answer" == "j" ]]; then
        sudo paccache -rv -k 3
        echo
        echo "Fertig! Der Paket-Cache wurde aufgeräumt."
    else
        echo "Okay, es wurde nichts gelöscht."
    fi
}

# Hauptmenü
while true; do
    echo
    echo "=============================="
    echo "     Pombes System Cleaner"
    echo "=============================="
    echo
    echo "1. Speicherplatz anzeigen"
    echo "2. Alte Pakete anzeigen"
    echo "3. Paket-Cache aufräumen"
    echo "4. Programm beenden"
    echo

    read -r -p "Was möchtest du machen? " choice

    case "$choice" in
        1)
            show_disk
            ;;
        2)
            show_old_packages
            ;;
        3)
            clean_cache
            ;;
        4)
            echo "Bis zum nächsten Mal!"
            break
            ;;
        *)
            echo "Bitte wähle eine Zahl zwischen 1 und 4."
            ;;
    esac
done

