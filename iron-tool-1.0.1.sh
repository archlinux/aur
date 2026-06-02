#!/bin/bash
echo -e "${CYAN}"
echo ' .+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.'
echo '(      ___ ____   ___  _   _     _____ ___   ___  _           )'
echo ' )    |_ _|  _ \ / _ \| \ | |   |_   _/ _ \ / _ \| |         ( '
echo '(      | || |_) | | | |  \| |_____| || | | | | | | |          )'
echo ' )     | ||  _ <| |_| | |\  |_____| || |_| | |_| | |___      ( '
echo '(     |___|_| \_\\___/|_| \_|     |_| \___/ \___/|_____|      )'
echo ' )                    by ironcarrier                         ( '
echo '(                                                             )'
echo ' "+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"+.+"'
echo -e "${NC}"
echo ""

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m'

# ============ БАЗОВЫЕ ФУНКЦИИ ============

usb_mount() {
    ACTION=$1
    DEVICE=$2
    MOUNT_POINT="/mnt/usb"
    if [ "$ACTION" == "mount" ]; then
        if [ -z "$DEVICE" ]; then
            DEVICE=$(lsblk -rpo "name,type" | grep "part" | tail -1 | awk '{print $1}')
            echo -e "${YELLOW}Найдено устройство: $DEVICE${NC}"
        fi
        sudo mkdir -p $MOUNT_POINT
        sudo mount $DEVICE $MOUNT_POINT
        echo -e "${GREEN}==> Флешка примонтирована в $MOUNT_POINT${NC}"
        notify-send "USB" "Флешка примонтирована в $MOUNT_POINT"
    elif [ "$ACTION" == "umount" ]; then
        sudo umount $MOUNT_POINT
        echo -e "${GREEN}==> Флешка размонтирована${NC}"
        notify-send "USB" "Флешка безопасно извлечена"
    fi
}

clean_home() {
    echo -e "${YELLOW}==> Очистка домашней папки...${NC}"
    find ~/Downloads -mtime +30 -type f -delete
    rm -rf ~/.local/share/Trash/*
    rm -rf ~/.cache/thumbnails/*
    rm -rf /tmp/* 2>/dev/null
    echo -e "${GREEN}==> Домашняя папка очищена!${NC}"
    notify-send "Очистка" "Домашняя папка очищена"
}

watch_wm() {
    echo -e "${YELLOW}==> Запуск слежки за xfwm4...${NC}"
    while true; do
        if ! pgrep -x "xfwm4" > /dev/null; then
            echo -e "${RED}xfwm4 упал! Перезапускаем...${NC}"
            xfwm4 --replace --compositor=off &
            notify-send "WM" "xfwm4 был перезапущен"
        fi
        sleep 10
    done
}

update_system() {
    echo -e "${YELLOW}==> Обновление системы...${NC}"
    sudo pacman -Syu --noconfirm
    echo -e "${YELLOW}==> Обновление AUR пакетов...${NC}"
    yay -Syu --noconfirm
    echo -e "${YELLOW}==> Очистка кэша pacman...${NC}"
    sudo paccache -rk2
    echo -e "${YELLOW}==> Очистка кэша yay...${NC}"
    yay -Sc --noconfirm
    echo -e "${YELLOW}==> Очистка журналов systemd...${NC}"
    sudo journalctl --vacuum-time=2weeks
    echo -e "${GREEN}==> Система обновлена и очищена!${NC}"
    notify-send "Обновление" "Система обновлена и очищена"
}

disk_info() {
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}      ИНФОРМАЦИЯ О ДИСКАХ     ${NC}"
    echo -e "${BLUE}==============================${NC}"
    df -h | grep -v tmpfs | grep -v devtmpfs
    echo ""
    lsblk -o NAME,SIZE,TYPE,MOUNTPOINT,FSTYPE
}

network_info() {
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}     СЕТЕВАЯ ИНФОРМАЦИЯ       ${NC}"
    echo -e "${BLUE}==============================${NC}"
    ip -br addr
    echo ""
    iwconfig wlan0 2>/dev/null | grep -E "ESSID|Signal|Bit Rate"
    echo ""
    curl -s ifconfig.me 2>/dev/null && echo ""
    echo ""
    ping -c 3 google.com | tail -2
    echo ""
    ip route
}

ids_monitor() {
    LOGFILE=~/ids.log
    WATCH_FILES="/etc/passwd /etc/sudoers /etc/shadow /etc/hosts"
    echo -e "${RED}==> Запуск IDS мониторинга...${NC}"
    echo -e "${YELLOW}Лог: $LOGFILE | Ctrl+C для остановки${NC}"
    declare -A FILE_HASHES
    for f in $WATCH_FILES; do
        if [ -f "$f" ]; then
            FILE_HASHES[$f]=$(sudo md5sum $f 2>/dev/null | awk '{print $1}')
        fi
    done
    while true; do
        TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
        for f in $WATCH_FILES; do
            if [ -f "$f" ]; then
                CURRENT_HASH=$(sudo md5sum $f 2>/dev/null | awk '{print $1}')
                if [ "${FILE_HASHES[$f]}" != "$CURRENT_HASH" ]; then
                    MSG="[$TIMESTAMP] ВНИМАНИЕ: Изменён файл $f!"
                    echo -e "${RED}$MSG${NC}"
                    echo "$MSG" >> $LOGFILE
                    notify-send "IDS ТРЕВОГА" "Изменён файл: $f" --urgency=critical
                    FILE_HASHES[$f]=$CURRENT_HASH
                fi
            fi
        done
        SUSPICIOUS=$(ps aux | grep -E "nc |ncat |netcat |nmap |tcpdump " | grep -v grep)
        if [ ! -z "$SUSPICIOUS" ]; then
            MSG="[$TIMESTAMP] ПОДОЗРИТЕЛЬНЫЙ ПРОЦЕСС: $SUSPICIOUS"
            echo -e "${RED}$MSG${NC}"
            echo "$MSG" >> $LOGFILE
            notify-send "IDS ТРЕВОГА" "Подозрительный процесс!" --urgency=critical
        fi
        CONNECTIONS=$(ss -tnp | grep ESTAB | grep -v "127.0.0.1")
        if [ ! -z "$CONNECTIONS" ]; then
            echo -e "${YELLOW}[$TIMESTAMP] Активные подключения:${NC}"
            echo "$CONNECTIONS"
        fi
        sleep 15
    done
}

system_restore() {
    BACKUP_DIR=~/system-backups
    mkdir -p $BACKUP_DIR
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}   ВОССТАНОВЛЕНИЕ СИСТЕМЫ    ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Создать снапшот пакетов"
    echo -e "${GREEN}2)${NC} Показать снапшоты"
    echo -e "${GREEN}3)${NC} Восстановить из снапшота"
    echo -e "${GREEN}4)${NC} Откатить пакет из кэша"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read RCHOICE
    case $RCHOICE in
        1)
            SNAPSHOT="$BACKUP_DIR/pkglist-$(date '+%Y%m%d-%H%M%S').txt"
            pacman -Qqe > $SNAPSHOT
            echo -e "${GREEN}==> Снапшот сохранён: $SNAPSHOT${NC}"
            ;;
        2)
            ls -lh $BACKUP_DIR/*.txt 2>/dev/null || echo "Снапшотов нет"
            ;;
        3)
            ls $BACKUP_DIR/*.txt 2>/dev/null
            echo -n "Введите имя файла снапшота: "
            read SNAPFILE
            if [ -f "$SNAPFILE" ]; then
                sudo pacman -S --needed $(cat $SNAPFILE) --noconfirm
                echo -e "${GREEN}==> Восстановление завершено!${NC}"
            else
                echo -e "${RED}Файл не найден!${NC}"
            fi
            ;;
        4)
            grep "upgraded\|installed\|removed" /var/log/pacman.log | tail -20
            echo -n "Введите название пакета: "
            read PKG
            echo -n "Введите версию: "
            read VER
            PKGFILE=$(find /var/cache/pacman/pkg/ -name "${PKG}-${VER}*.pkg.tar.*" 2>/dev/null | head -1)
            if [ ! -z "$PKGFILE" ]; then
                sudo pacman -U $PKGFILE
            else
                echo -e "${RED}Пакет не найден в кэше!${NC}"
            fi
            ;;
        0) return ;;
    esac
}

perf_monitor() {
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}  МОНИТОРИНГ ПРОИЗВОДИТЕЛЬНОСТИ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Мониторинг в реальном времени"
    echo -e "${GREEN}2)${NC} Записать метрики в лог"
    echo -e "${GREEN}3)${NC} Показать последние метрики"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read PCHOICE
    case $PCHOICE in
        1)
            echo -e "${YELLOW}Нажмите Ctrl+C для остановки${NC}"
            while true; do
                clear
                TIMESTAMP=$(date '+%H:%M:%S')
                CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | tr -d '%us,')
                RAM=$(free -m | awk 'NR==2{printf "%.1f/%.1f MB (%.0f%%)", $3,$2,$3*100/$2}')
                TEMP=$(sensors 2>/dev/null | grep "Core 0" | awk '{print $3}' | tr -d '+°C')
                DISK=$(df -h / | awk 'NR==2{print $3"/"$2" ("$5")"}')
                RX1=$(cat /sys/class/net/wlan0/statistics/rx_bytes 2>/dev/null || echo 0)
                TX1=$(cat /sys/class/net/wlan0/statistics/tx_bytes 2>/dev/null || echo 0)
                sleep 2
                RX2=$(cat /sys/class/net/wlan0/statistics/rx_bytes 2>/dev/null || echo 0)
                TX2=$(cat /sys/class/net/wlan0/statistics/tx_bytes 2>/dev/null || echo 0)
                RX_SPEED=$(( ($RX2 - $RX1) / 2 / 1024 ))
                TX_SPEED=$(( ($TX2 - $TX1) / 2 / 1024 ))
                echo -e "${BLUE}==============================${NC}"
                echo -e "${BLUE}  СИСТЕМА [$TIMESTAMP]${NC}"
                echo -e "${BLUE}==============================${NC}"
                echo -e "${YELLOW}CPU:${NC}         ${CPU}%"
                echo -e "${YELLOW}RAM:${NC}         ${RAM}"
                echo -e "${YELLOW}Температура:${NC} ${TEMP}C"
                echo -e "${YELLOW}Диск /:${NC}      ${DISK}"
                echo -e "${YELLOW}Сеть вх:${NC}     ${RX_SPEED} KB/s"
                echo -e "${YELLOW}Сеть исх:${NC}    ${TX_SPEED} KB/s"
                echo ""
                echo -e "${YELLOW}Топ по CPU:${NC}"
                ps aux --sort=-%cpu | head -6 | awk '{printf "%-20s %s%%\n", $11, $3}'
                echo ""
                echo -e "${YELLOW}Топ по RAM:${NC}"
                ps aux --sort=-%mem | head -6 | awk '{printf "%-20s %s%%\n", $11, $4}'
            done
            ;;
        2)
            LOGFILE=~/perf.log
            echo -e "${YELLOW}Запись в $LOGFILE каждые 30 секунд... Ctrl+C для остановки${NC}"
            while true; do
                TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
                CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | tr -d '%us,')
                RAM=$(free -m | awk 'NR==2{printf "%.0f", $3*100/$2}')
                TEMP=$(sensors 2>/dev/null | grep "Core 0" | awk '{print $3}' | tr -d '+°C')
                DISK=$(df / | awk 'NR==2{print $5}' | tr -d '%')
                echo "$TIMESTAMP CPU:${CPU}% RAM:${RAM}% TEMP:${TEMP}C DISK:${DISK}%" >> $LOGFILE
                echo -e "${GREEN}[$TIMESTAMP] Записано${NC}"
                sleep 30
            done
            ;;
        3)
            tail -20 ~/perf.log 2>/dev/null || echo "Лог пуст"
            ;;
        0) return ;;
    esac
}

config_manager() {
    CONFIG_REPO=~/config-backup
    WATCH_CONFIGS=(
        "/etc/pacman.conf"
        "/etc/fstab"
        "/etc/hosts"
        "/etc/X11/xorg.conf.d"
        "$HOME/.bash_profile"
        "$HOME/.bashrc"
        "$HOME/tools.sh"
        "$HOME/fix-wm.sh"
    )
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}   МЕНЕДЖЕР КОНФИГУРАЦИЙ     ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Инициализировать репозиторий"
    echo -e "${GREEN}2)${NC} Сохранить текущие конфиги"
    echo -e "${GREEN}3)${NC} Показать историю изменений"
    echo -e "${GREEN}4)${NC} Показать что изменилось"
    echo -e "${GREEN}5)${NC} Восстановить файл из истории"
    echo -e "${GREEN}6)${NC} Авто-слежка за конфигами"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read CCHOICE
    case $CCHOICE in
        1)
            mkdir -p $CONFIG_REPO
            cd $CONFIG_REPO
            git init
            git config user.email "ironcarrier@archlinux"
            git config user.name "ironcarrier"
            echo -e "${GREEN}==> Репозиторий инициализирован!${NC}"
            ;;
        2)
            mkdir -p $CONFIG_REPO
            for f in "${WATCH_CONFIGS[@]}"; do
                if [ -f "$f" ]; then
                    DEST="$CONFIG_REPO$(dirname $f)"
                    mkdir -p "$DEST"
                    sudo cp "$f" "$DEST/" 2>/dev/null
                    echo -e "${BLUE}Скопирован: $f${NC}"
                elif [ -d "$f" ]; then
                    DEST="$CONFIG_REPO$f"
                    mkdir -p "$DEST"
                    sudo cp -r "$f"/* "$DEST/" 2>/dev/null
                    echo -e "${BLUE}Скопирована папка: $f${NC}"
                fi
            done
            cd $CONFIG_REPO
            git add -A
            git commit -m "Снапшот $(date '+%Y-%m-%d %H:%M:%S')" 2>/dev/null
            echo -e "${GREEN}==> Конфиги сохранены!${NC}"
            ;;
        3)
            cd $CONFIG_REPO 2>/dev/null || { echo -e "${RED}Сначала инициализируйте репозиторий!${NC}"; return; }
            git log --oneline --graph | head -20
            ;;
        4)
            cd $CONFIG_REPO 2>/dev/null || { echo -e "${RED}Сначала инициализируйте репозиторий!${NC}"; return; }
            git diff HEAD~1 HEAD 2>/dev/null || echo "Нет предыдущих коммитов"
            ;;
        5)
            cd $CONFIG_REPO 2>/dev/null || { echo -e "${RED}Сначала инициализируйте репозиторий!${NC}"; return; }
            git log --oneline | head -10
            echo -n "Введите хэш коммита: "
            read HASH
            echo -n "Введите путь файла: "
            read FPATH
            git show "$HASH:$FPATH" 2>/dev/null || echo -e "${RED}Файл не найден!${NC}"
            ;;
        6)
            echo -e "${YELLOW}Авто-слежка запущена... Ctrl+C для остановки${NC}"
            while true; do
                CHANGED=0
                for f in "${WATCH_CONFIGS[@]}"; do
                    if [ -f "$f" ]; then
                        DEST="$CONFIG_REPO$(dirname $f)/$(basename $f)"
                        if [ -f "$DEST" ]; then
                            if ! diff -q "$f" "$DEST" > /dev/null 2>&1; then
                                CHANGED=1
                                echo -e "${YELLOW}Изменён: $f${NC}"
                            fi
                        fi
                    fi
                done
                if [ $CHANGED -eq 1 ]; then
                    for f in "${WATCH_CONFIGS[@]}"; do
                        if [ -f "$f" ]; then
                            DEST="$CONFIG_REPO$(dirname $f)"
                            mkdir -p "$DEST"
                            sudo cp "$f" "$DEST/" 2>/dev/null
                        fi
                    done
                    cd $CONFIG_REPO
                    git add -A
                    git commit -m "Авто-снапшот $(date '+%Y-%m-%d %H:%M:%S')" 2>/dev/null
                    notify-send "Конфиги" "Изменения сохранены в git"
                fi
                sleep 60
            done
            ;;
        0) return ;;
    esac
}

traffic_analyzer() {
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}     АНАЛИЗАТОР ТРАФИКА      ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Показать активные подключения"
    echo -e "${GREEN}2)${NC} Трафик по процессам"
    echo -e "${GREEN}3)${NC} Мониторинг трафика в реальном времени"
    echo -e "${GREEN}4)${NC} Показать открытые порты"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read TCHOICE
    case $TCHOICE in
        1)
            ss -tnp | grep ESTAB
            echo ""
            ss -tunp
            ;;
        2)
            if ! command -v nethogs &>/dev/null; then
                sudo pacman -S nethogs --noconfirm
            fi
            sudo nethogs wlan0
            ;;
        3)
            echo -e "${YELLOW}Ctrl+C для остановки${NC}"
            while true; do
                RX1=$(cat /sys/class/net/wlan0/statistics/rx_bytes 2>/dev/null || echo 0)
                TX1=$(cat /sys/class/net/wlan0/statistics/tx_bytes 2>/dev/null || echo 0)
                sleep 1
                RX2=$(cat /sys/class/net/wlan0/statistics/rx_bytes 2>/dev/null || echo 0)
                TX2=$(cat /sys/class/net/wlan0/statistics/tx_bytes 2>/dev/null || echo 0)
                RX_SPEED=$(( ($RX2 - $RX1) / 1024 ))
                TX_SPEED=$(( ($TX2 - $TX1) / 1024 ))
                RX_TOTAL=$(( $RX2 / 1024 / 1024 ))
                TX_TOTAL=$(( $TX2 / 1024 / 1024 ))
                printf "\r${GREEN}down ${RX_SPEED} KB/s${NC}  ${RED}up ${TX_SPEED} KB/s${NC}  Total: ${YELLOW}down ${RX_TOTAL}MB up ${TX_TOTAL}MB${NC}    "
            done
            ;;
        4)
            sudo ss -tlnp
            echo ""
            sudo ss -ulnp
            ;;
        0) return ;;
    esac
}

vuln_scanner() {
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}     СКАНЕР УЯЗВИМОСТЕЙ      ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Проверить слабые права файлов"
    echo -e "${GREEN}2)${NC} Проверить открытые порты"
    echo -e "${GREEN}3)${NC} Проверить устаревшие пакеты"
    echo -e "${GREEN}4)${NC} Проверить SUID/SGID файлы"
    echo -e "${GREEN}5)${NC} Проверить пустые пароли"
    echo -e "${GREEN}6)${NC} Полный аудит безопасности"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read VCHOICE
    case $VCHOICE in
        1)
            find / -not -path "/proc/*" -not -path "/sys/*" -perm -o+w -type f 2>/dev/null | grep -v "/tmp\|/dev\|/run" | head -20
            find / -not -path "/proc/*" -not -path "/sys/*" -nouser -o -nogroup 2>/dev/null | head -10
            ;;
        2)
            sudo ss -tlnp
            PORTS=$(sudo ss -tlnp | awk 'NR>1 {print $4}' | awk -F: '{print $NF}')
            for port in $PORTS; do
                case $port in
                    21)  echo -e "${RED}РИСК: FTP!${NC}" ;;
                    23)  echo -e "${RED}РИСК: Telnet!${NC}" ;;
                    80)  echo -e "${YELLOW}ИНФО: HTTP${NC}" ;;
                    3306) echo -e "${YELLOW}ИНФО: MySQL${NC}" ;;
                esac
            done
            ;;
        3)
            sudo pacman -Sy --noconfirm > /dev/null 2>&1
            UPDATES=$(pacman -Qu 2>/dev/null | wc -l)
            echo -e "Доступно обновлений: ${RED}$UPDATES${NC}"
            pacman -Qu 2>/dev/null
            ;;
        4)
            find / -not -path "/proc/*" -not -path "/sys/*" -perm -4000 -type f 2>/dev/null
            find / -not -path "/proc/*" -not -path "/sys/*" -perm -2000 -type f 2>/dev/null
            ;;
        5)
            sudo awk -F: '($2 == "" ) {print "ПУСТОЙ ПАРОЛЬ: "$1}' /etc/shadow 2>/dev/null
            awk -F: '($3 == 0) {print $1}' /etc/passwd
            ;;
        6)
            REPORT=~/security-report-$(date '+%Y%m%d-%H%M%S').txt
            echo "ОТЧЁТ БЕЗОПАСНОСТИ $(date)" > $REPORT
            find / -not -path "/proc/*" -not -path "/sys/*" -perm -o+w -type f 2>/dev/null | grep -v "/tmp\|/dev\|/run" >> $REPORT
            find / -not -path "/proc/*" -not -path "/sys/*" -perm -4000 -type f 2>/dev/null >> $REPORT
            sudo ss -tlnp >> $REPORT
            awk -F: '($3 == 0) {print $1}' /etc/passwd >> $REPORT
            pacman -Qu 2>/dev/null >> $REPORT
            echo -e "${GREEN}==> Отчёт: $REPORT${NC}"
            ;;
        0) return ;;
    esac
}

file_crypto() {
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}     ШИФРОВАНИЕ ФАЙЛОВ       ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Зашифровать файл"
    echo -e "${GREEN}2)${NC} Расшифровать файл"
    echo -e "${GREEN}3)${NC} Зашифровать папку"
    echo -e "${GREEN}4)${NC} Расшифровать папку"
    echo -e "${GREEN}5)${NC} Создать ключи GPG"
    echo -e "${GREEN}6)${NC} Список ключей GPG"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read FCHOICE
    case $FCHOICE in
        1)
            echo -n "Путь к файлу: "
            read FILEPATH
            [ ! -f "$FILEPATH" ] && echo -e "${RED}Файл не найден!${NC}" && return
            gpg --symmetric --cipher-algo AES256 "$FILEPATH"
            echo -e "${GREEN}==> Зашифрован: ${FILEPATH}.gpg${NC}"
            ;;
        2)
            echo -n "Путь к .gpg файлу: "
            read FILEPATH
            [ ! -f "$FILEPATH" ] && echo -e "${RED}Файл не найден!${NC}" && return
            gpg --decrypt --output "${FILEPATH%.gpg}" "$FILEPATH"
            ;;
        3)
            echo -n "Путь к папке: "
            read DIRPATH
            [ ! -d "$DIRPATH" ] && echo -e "${RED}Папка не найдена!${NC}" && return
            DIRNAME=$(basename "$DIRPATH")
            tar -czf "/tmp/${DIRNAME}.tar.gz" "$DIRPATH"
            gpg --symmetric --cipher-algo AES256 "/tmp/${DIRNAME}.tar.gz"
            rm "/tmp/${DIRNAME}.tar.gz"
            mv "/tmp/${DIRNAME}.tar.gz.gpg" ~/
            echo -e "${GREEN}==> Зашифровано: ~/${DIRNAME}.tar.gz.gpg${NC}"
            ;;
        4)
            echo -n "Путь к .tar.gz.gpg: "
            read FILEPATH
            [ ! -f "$FILEPATH" ] && echo -e "${RED}Файл не найден!${NC}" && return
            OUTFILE="${FILEPATH%.gpg}"
            gpg --decrypt --output "$OUTFILE" "$FILEPATH"
            tar -xzf "$OUTFILE" -C ~/
            rm "$OUTFILE"
            ;;
        5) gpg --full-generate-key ;;
        6) gpg --list-keys; gpg --list-secret-keys ;;
        0) return ;;
    esac
}

autostart_manager() {
    AUTOSTART_DIR=~/.config/autostart
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}   МЕНЕДЖЕР АВТОЗАПУСКА      ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Показать автозапуск XFCE"
    echo -e "${GREEN}2)${NC} Включить/выключить элемент"
    echo -e "${GREEN}3)${NC} Добавить в автозапуск"
    echo -e "${GREEN}4)${NC} Удалить из автозапуска"
    echo -e "${GREEN}5)${NC} Службы systemd пользователя"
    echo -e "${GREEN}6)${NC} Всё что запускается при старте"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read ACHOICE
    case $ACHOICE in
        1)
            if [ -d "$AUTOSTART_DIR" ]; then
                for f in $AUTOSTART_DIR/*.desktop; do
                    NAME=$(grep "^Name=" "$f" | head -1 | cut -d= -f2)
                    EXEC=$(grep "^Exec=" "$f" | head -1 | cut -d= -f2)
                    HIDDEN=$(grep "^Hidden=" "$f" | head -1 | cut -d= -f2)
                    [ "$HIDDEN" == "true" ] && STATUS="${RED}ВЫКЛ${NC}" || STATUS="${GREEN}ВКЛ${NC}"
                    echo -e "[$STATUS] ${YELLOW}$NAME${NC} - $EXEC"
                done
            fi
            ;;
        2)
            ls $AUTOSTART_DIR/*.desktop 2>/dev/null
            echo -n "Имя файла: "
            read DFILE
            FULL_PATH="$AUTOSTART_DIR/$DFILE"
            if [ -f "$FULL_PATH" ]; then
                HIDDEN=$(grep "^Hidden=" "$FULL_PATH" | cut -d= -f2)
                if [ "$HIDDEN" == "true" ]; then
                    sed -i 's/^Hidden=true/Hidden=false/' "$FULL_PATH"
                    echo -e "${GREEN}==> Включено!${NC}"
                else
                    sed -i '/^Hidden=/d' "$FULL_PATH"
                    echo "Hidden=true" >> "$FULL_PATH"
                    echo -e "${RED}==> Выключено!${NC}"
                fi
            fi
            ;;
        3)
            echo -n "Название: "
            read ANAME
            echo -n "Команда: "
            read AEXEC
            mkdir -p $AUTOSTART_DIR
            cat > "$AUTOSTART_DIR/${ANAME}.desktop" << DESKTOP
[Desktop Entry]
Type=Application
Name=$ANAME
Exec=$AEXEC
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
DESKTOP
            echo -e "${GREEN}==> Добавлено!${NC}"
            ;;
        4)
            ls $AUTOSTART_DIR/*.desktop 2>/dev/null
            echo -n "Имя файла: "
            read DFILE
            rm "$AUTOSTART_DIR/$DFILE" 2>/dev/null && echo -e "${GREEN}==> Удалено!${NC}"
            ;;
        5) systemctl --user list-units --type=service 2>/dev/null ;;
        6)
            echo -e "${BLUE}--- Автозапуск XFCE ---${NC}"
            ls $AUTOSTART_DIR/*.desktop 2>/dev/null | xargs -I{} grep "^Name=" {} | cut -d= -f2
            echo -e "${BLUE}--- Systemd ---${NC}"
            systemctl list-unit-files --state=enabled 2>/dev/null | head -20
            echo -e "${BLUE}--- Cron ---${NC}"
            crontab -l 2>/dev/null
            ;;
        0) return ;;
    esac
}

honeypot() {
    LOGFILE=~/honeypot.log
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}          HONEYPOT            ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Запустить honeypot в фоне"
    echo -e "${GREEN}2)${NC} Показать лог"
    echo -e "${GREEN}3)${NC} Очистить лог"
    echo -e "${GREEN}4)${NC} Остановить"
    echo -e "${GREEN}5)${NC} Статус"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read HCHOICE

    listen_port() {
        PORT=$1
        SERVICE=$2
        while true; do
            nc -l -p $PORT -q 1 > /dev/null 2>&1
            TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
            echo "[$TIMESTAMP] HONEYPOT: Подключение к $SERVICE (порт $PORT)" >> $LOGFILE
            notify-send "HONEYPOT" "Подключение к $SERVICE!" --urgency=critical
        done
    }

    case $HCHOICE in
        1)
            if ! command -v nc &>/dev/null; then
                sudo pacman -S openbsd-netcat --noconfirm
            fi
            listen_port 21 "FTP" &
            PID_FTP=$!
            listen_port 23 "Telnet" &
            PID_TELNET=$!
            listen_port 3306 "MySQL" &
            PID_MYSQL=$!
            echo "$PID_FTP $PID_TELNET $PID_MYSQL" > /tmp/honeypot.pids
            echo -e "${GREEN}==> Honeypot запущен в фоне! Лог: $LOGFILE${NC}"
            ;;
        2) cat $LOGFILE 2>/dev/null || echo "Лог пуст" ;;
        3) > $LOGFILE && echo -e "${GREEN}==> Лог очищен!${NC}" ;;
        4)
            if [ -f /tmp/honeypot.pids ]; then
                for PID in $(cat /tmp/honeypot.pids); do kill $PID 2>/dev/null; done
                rm /tmp/honeypot.pids
                echo -e "${GREEN}==> Остановлен!${NC}"
            fi
            ;;
        5)
            [ -f /tmp/honeypot.pids ] && for PID in $(cat /tmp/honeypot.pids); do
                kill -0 $PID 2>/dev/null && echo -e "${GREEN}PID $PID активен${NC}" || echo -e "${RED}PID $PID неактивен${NC}"
            done || echo -e "${RED}Не запущен${NC}"
            ;;
        0) return ;;
    esac
}

rootkit_detector() {
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}      ROOTKIT ДЕТЕКТОР       ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Проверить через rkhunter"
    echo -e "${GREEN}2)${NC} Скрытые процессы"
    echo -e "${GREEN}3)${NC} Модули ядра"
    echo -e "${GREEN}4)${NC} Целостность пакетов"
    echo -e "${GREEN}5)${NC} Процессы с удалёнными бинарниками"
    echo -e "${GREEN}6)${NC} Полная проверка"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read RKCHOICE
    case $RKCHOICE in
        1)
            if ! command -v rkhunter &>/dev/null; then
                sudo pacman -S rkhunter --noconfirm
                sudo rkhunter --update
            fi
            sudo rkhunter --check --skip-keypress
            ;;
        2)
            PROC_PIDS=$(ls /proc | grep '^[0-9]' | sort -n)
            PS_PIDS=$(ps aux | awk 'NR>1 {print $2}' | sort -n)
            HIDDEN=0
            for pid in $PROC_PIDS; do
                if ! echo "$PS_PIDS" | grep -q "^${pid}$"; then
                    CMD=$(cat /proc/$pid/cmdline 2>/dev/null | tr '\0' ' ')
                    if [ ! -z "$CMD" ]; then
                        echo -e "${RED}СКРЫТЫЙ: PID=$pid CMD=$CMD${NC}"
                        HIDDEN=1
                    fi
                fi
            done
            [ $HIDDEN -eq 0 ] && echo -e "${GREEN}Скрытых процессов нет${NC}"
            ;;
        3) lsmod ;;
        4)
            REPORT=~/rootkit-$(date '+%Y%m%d-%H%M%S').txt
            sudo pacman -Qkk 2>/dev/null | grep "FAILED" | tee $REPORT
            echo -e "${GREEN}==> Отчёт: $REPORT${NC}"
            ;;
        5)
            for pid in $(ls /proc | grep '^[0-9]'); do
                EXE=$(readlink /proc/$pid/exe 2>/dev/null)
                if echo "$EXE" | grep -q "(deleted)"; then
                    echo -e "${RED}PID $pid: $EXE${NC}"
                fi
            done
            ;;
        6)
            REPORT=~/full-rootkit-$(date '+%Y%m%d-%H%M%S').txt
            lsmod > $REPORT
            sudo pacman -Qkk 2>/dev/null | grep "FAILED" >> $REPORT
            ps aux >> $REPORT
            find / -not -path "/proc/*" -not -path "/sys/*" -perm -4000 -type f 2>/dev/null >> $REPORT
            command -v rkhunter &>/dev/null && sudo rkhunter --check --skip-keypress >> $REPORT 2>/dev/null
            echo -e "${GREEN}==> Отчёт: $REPORT${NC}"
            ;;
        0) return ;;
    esac
}

crash_analyzer() {
    CRASH_DIR=~/crash-reports
    mkdir -p $CRASH_DIR
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}   АНАЛИЗАТОР CRASH ДАМПОВ   ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Последние падения"
    echo -e "${GREEN}2)${NC} Анализ процесса"
    echo -e "${GREEN}3)${NC} Включить авто-сбор"
    echo -e "${GREEN}4)${NC} Coredump файлы"
    echo -e "${GREEN}5)${NC} Анализ через gdb"
    echo -e "${GREEN}6)${NC} Мониторинг в реальном времени"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read CRCHOICE
    case $CRCHOICE in
        1)
            sudo journalctl -p err -n 30 --no-pager 2>/dev/null | grep -i "segfault\|crash\|core dump\|killed"
            coredumpctl list 2>/dev/null | head -20
            ;;
        2)
            echo -n "Имя процесса: "
            read PROCNAME
            sudo journalctl -n 100 --no-pager 2>/dev/null | grep -i "$PROCNAME" | grep -i "segfault\|crash\|error\|killed"
            PID=$(pgrep "$PROCNAME" | head -1)
            [ ! -z "$PID" ] && sudo lsof -p $PID 2>/dev/null | head -20
            ;;
        3)
            sudo mkdir -p /etc/systemd/coredump.conf.d/
            sudo bash -c 'cat > /etc/systemd/coredump.conf.d/custom.conf << CONF
[Coredump]
Storage=external
Compress=yes
ProcessSizeMax=2G
ExternalSizeMax=2G
CONF'
            echo "* soft core unlimited" | sudo tee -a /etc/security/limits.conf > /dev/null
            echo -e "${GREEN}==> Авто-сбор включён!${NC}"
            ;;
        4)
            coredumpctl list 2>/dev/null || echo "Нет дампов"
            ls -lh $CRASH_DIR/
            ;;
        5)
            coredumpctl list 2>/dev/null | head -10
            echo -n "PID или имя: "
            read CORE_PROC
            ! command -v gdb &>/dev/null && sudo pacman -S gdb --noconfirm
            coredumpctl gdb $CORE_PROC 2>/dev/null
            ;;
        6)
            echo -e "${YELLOW}Мониторинг... Ctrl+C для остановки${NC}"
            LAST_COUNT=$(coredumpctl list 2>/dev/null | wc -l)
            while true; do
                CURRENT_COUNT=$(coredumpctl list 2>/dev/null | wc -l)
                if [ "$CURRENT_COUNT" -gt "$LAST_COUNT" ]; then
                    NEW_CRASH=$(coredumpctl list 2>/dev/null | tail -1)
                    echo -e "${RED}[$(date '+%H:%M:%S')] ПАДЕНИЕ: $NEW_CRASH${NC}"
                    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $NEW_CRASH" >> $CRASH_DIR/crash.log
                    notify-send "CRASH" "Новое падение!" --urgency=critical
                    LAST_COUNT=$CURRENT_COUNT
                fi
                sleep 10
            done
            ;;
        0) return ;;
    esac
}

memory_analyzer() {
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}     АНАЛИЗАТОР ПАМЯТИ       ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Карта памяти процесса"
    echo -e "${GREEN}2)${NC} Поиск строк в памяти"
    echo -e "${GREEN}3)${NC} Использование памяти"
    echo -e "${GREEN}4)${NC} Утечки памяти"
    echo -e "${GREEN}5)${NC} Дамп памяти процесса"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read MCHOICE
    case $MCHOICE in
        1)
            echo -n "PID или имя: "
            read PROC
            PID=$(pgrep "$PROC" 2>/dev/null | head -1 || echo $PROC)
            [ -f "/proc/$PID/maps" ] && sudo cat /proc/$PID/maps | head -40 && sudo cat /proc/$PID/status | grep -i "vm\|mem" || echo -e "${RED}Не найден!${NC}"
            ;;
        2)
            echo -n "PID или имя: "
            read PROC
            PID=$(pgrep "$PROC" 2>/dev/null | head -1 || echo $PROC)
            echo -n "Строка: "
            read SEARCH_STR
            sudo grep -a "$SEARCH_STR" /proc/$PID/mem 2>/dev/null | head -10 || echo "Не найдено"
            ;;
        3)
            free -h
            echo ""
            ps aux --sort=-%mem | head -15 | awk '{printf "%-8s %-20s %.1f MB\n", $2, $11, $6/1024}'
            echo ""
            cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|SwapTotal|SwapFree|Cached"
            ;;
        4)
            ps aux --sort=-%mem | awk 'NR>1 && $6>51200 {printf "PID:%-8s MEM:%.1f MB %s\n", $2, $6/1024, $11}'
            for pid in $(ls /proc | grep '^[0-9]' | head -50); do
                FD_COUNT=$(ls /proc/$pid/fd 2>/dev/null | wc -l)
                if [ $FD_COUNT -gt 100 ]; then
                    CMD=$(cat /proc/$pid/comm 2>/dev/null)
                    echo -e "${YELLOW}PID $pid ($CMD): $FD_COUNT файлов${NC}"
                fi
            done
            ;;
        5)
            echo -n "PID: "
            read PID
            DUMPFILE=~/memdump-${PID}-$(date '+%Y%m%d-%H%M%S').bin
            [ -f "/proc/$PID/mem" ] && sudo cat /proc/$PID/maps | awk '{print $1}' | while IFS=- read start end; do
                sudo dd if=/proc/$PID/mem bs=4096 skip=$((16#$start/4096)) count=$(( (16#$end - 16#$start) / 4096 )) >> $DUMPFILE 2>/dev/null
            done && echo -e "${GREEN}==> Дамп: $DUMPFILE${NC}" || echo -e "${RED}Не найден!${NC}"
            ;;
        0) return ;;
    esac
}

kernel_rootkit_detector() {
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}  ДЕТЕКТОР РУТКИТОВ ЯДРА     ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Системные вызовы"
    echo -e "${GREEN}2)${NC} Таблица прерываний"
    echo -e "${GREEN}3)${NC} Хуки в ядре"
    echo -e "${GREEN}4)${NC} Аномалии /proc и /sys"
    echo -e "${GREEN}5)${NC} Сравнить модули с эталоном"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read KRCHOICE
    case $KRCHOICE in
        1)
            sudo grep -E "sys_call_table|ksys_" /proc/kallsyms 2>/dev/null | head -20
            ! command -v strace &>/dev/null && sudo pacman -S strace --noconfirm
            strace -c ls /tmp 2>&1 | tail -10
            ;;
        2) sudo cat /proc/interrupts | head -30 ;;
        3)
            sudo cat /proc/modules 2>/dev/null | awk '{print $1, $6}' | head -20
            sudo cat /sys/kernel/debug/tracing/enabled_functions 2>/dev/null | head -20 || echo "ftrace недоступен"
            ;;
        4)
            PROC_COUNT=$(ls /proc | grep '^[0-9]' | wc -l)
            PS_COUNT=$(ps aux | wc -l)
            echo "В /proc: $PROC_COUNT | В ps: $PS_COUNT"
            [ $PROC_COUNT -gt $(($PS_COUNT + 5)) ] && echo -e "${RED}АНОМАЛИЯ!${NC}" || echo -e "${GREEN}Норма${NC}"
            ;;
        5)
            BASELINE=~/kernel-modules-baseline.txt
            CURRENT=~/kernel-modules-current.txt
            lsmod | awk 'NR>1 {print $1}' | sort > $CURRENT
            if [ -f "$BASELINE" ]; then
                echo -e "${BLUE}Новые:${NC}"
                diff $BASELINE $CURRENT | grep "^>" | awk '{print $2}' | while read m; do echo -e "${RED}$m${NC}"; done
                echo -e "${BLUE}Удалённые:${NC}"
                diff $BASELINE $CURRENT | grep "^<" | awk '{print $2}' | while read m; do echo -e "${YELLOW}$m${NC}"; done
            else
                cp $CURRENT $BASELINE
                echo -e "${GREEN}==> Эталон создан!${NC}"
            fi
            ;;
        0) return ;;
    esac
}

forensic_collector() {
    FORENSIC_DIR=~/forensic-$(date '+%Y%m%d-%H%M%S')
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}      ФОРЕНЗИК СБОРЩИК       ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Полный форензик отчёт"
    echo -e "${GREEN}2)${NC} Быстрый снапшот"
    echo -e "${GREEN}3)${NC} Сетевые данные"
    echo -e "${GREEN}4)${NC} Данные о процессах"
    echo -e "${GREEN}5)${NC} История команд"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read FFCHOICE
    case $FFCHOICE in
        1)
            mkdir -p $FORENSIC_DIR
            uname -a > $FORENSIC_DIR/system.txt; uptime >> $FORENSIC_DIR/system.txt
            who >> $FORENSIC_DIR/system.txt; last | head -20 >> $FORENSIC_DIR/system.txt
            ps auxf > $FORENSIC_DIR/processes.txt
            pstree > $FORENSIC_DIR/pstree.txt
            ss -anp > $FORENSIC_DIR/network.txt; ip addr >> $FORENSIC_DIR/network.txt
            ip route >> $FORENSIC_DIR/network.txt; cat /proc/net/arp >> $FORENSIC_DIR/network.txt
            df -h > $FORENSIC_DIR/disk.txt; lsblk >> $FORENSIC_DIR/disk.txt
            sudo journalctl -n 500 --no-pager > $FORENSIC_DIR/journal.txt 2>/dev/null
            sudo lsof > $FORENSIC_DIR/open_files.txt 2>/dev/null
            sudo cat /home/*/.bash_history > $FORENSIC_DIR/bash_history.txt 2>/dev/null
            cat /etc/passwd > $FORENSIC_DIR/users.txt
            crontab -l > $FORENSIC_DIR/crontab.txt 2>/dev/null
            lsmod > $FORENSIC_DIR/modules.txt
            tar -czf "${FORENSIC_DIR}.tar.gz" "$FORENSIC_DIR" && rm -rf $FORENSIC_DIR
            echo -e "${GREEN}==> Отчёт: ${FORENSIC_DIR}.tar.gz${NC}"
            notify-send "Форензик" "Отчёт собран"
            ;;
        2)
            echo -e "${BLUE}=== $(date) ===${NC}"
            who; last | head -5; ps aux | wc -l
            ss -tn | grep ESTAB | wc -l; ss -tlnp | tail -n +2
            df -h /; free -h
            ;;
        3) ss -anp; cat /proc/net/arp; cat /etc/resolv.conf; ip route ;;
        4) pstree -p; sudo lsof -i 2>/dev/null | head -30 ;;
        5)
            cat ~/.bash_history 2>/dev/null | tail -30
            sudo cat /root/.bash_history 2>/dev/null | tail -20
            ;;
        0) return ;;
    esac
}

antiphishing_monitor() {
    PHISHING_DB=~/phishing-domains.txt
    LOG=~/antiphishing.log
    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}    АНТИФИШИНГ МОНИТОР       ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Обновить базу"
    echo -e "${GREEN}2)${NC} Проверить домен"
    echo -e "${GREEN}3)${NC} Мониторинг DNS"
    echo -e "${GREEN}4)${NC} Заблокированные домены"
    echo -e "${GREEN}5)${NC} Добавить в чёрный список"
    echo -e "${GREEN}6)${NC} Заблокировать через hosts"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read APCHOICE
    case $APCHOICE in
        1)
            curl -s "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" 2>/dev/null | grep "^0\.0\.0\.0" | awk '{print $2}' > $PHISHING_DB
            echo -e "${GREEN}==> Загружено $(wc -l < $PHISHING_DB) доменов${NC}"
            ;;
        2)
            echo -n "Домен: "
            read DOMAIN
            [ -f "$PHISHING_DB" ] && grep -q "^$DOMAIN$" $PHISHING_DB && echo -e "${RED}ОПАСНО!${NC}" && notify-send "ФИШИНГ" "$DOMAIN!" --urgency=critical || echo -e "${GREEN}Чисто${NC}"
            host $DOMAIN 2>/dev/null
            ;;
        3)
            ! command -v tcpdump &>/dev/null && sudo pacman -S tcpdump --noconfirm
            echo -e "${YELLOW}Мониторинг DNS... Ctrl+C для остановки${NC}"
            sudo tcpdump -i wlan0 -n port 53 2>/dev/null | while read line; do
                DOMAIN=$(echo "$line" | grep -oP '[A-Za-z0-9.-]+\.[a-z]{2,}' | head -1)
                [ ! -z "$DOMAIN" ] && [ -f "$PHISHING_DB" ] && grep -q "^$DOMAIN$" $PHISHING_DB && {
                    echo -e "${RED}ФИШИНГ: $DOMAIN${NC}"
                    echo "[$(date '+%H:%M:%S')] $DOMAIN" >> $LOG
                    notify-send "ФИШИНГ" "$DOMAIN!" --urgency=critical
                } || echo -e "${BLUE}DNS: $DOMAIN${NC}"
            done
            ;;
        4)
            grep "^0\.0\.0\.0" /etc/hosts | grep -v "localhost" | head -30
            cat $LOG 2>/dev/null | tail -20
            ;;
        5)
            echo -n "Домен: "
            read BAD_DOMAIN
            echo "$BAD_DOMAIN" >> $PHISHING_DB
            echo -e "${GREEN}==> Добавлен!${NC}"
            ;;
        6)
            echo -n "Домен: "
            read BLOCK_DOMAIN
            grep -q "$BLOCK_DOMAIN" /etc/hosts && echo -e "${YELLOW}Уже заблокирован${NC}" || {
                echo "0.0.0.0 $BLOCK_DOMAIN" | sudo tee -a /etc/hosts > /dev/null
                echo "0.0.0.0 www.$BLOCK_DOMAIN" | sudo tee -a /etc/hosts > /dev/null
                echo -e "${GREEN}==> Заблокирован!${NC}"
            }
            ;;
        0) return ;;
    esac
}

# ============ НОВЫЕ СЕРЬЁЗНЫЕ ФУНКЦИИ ============

siem_system() {
    SIEM_DIR=~/siem
    SIEM_LOG=$SIEM_DIR/events.log
    SIEM_RULES=$SIEM_DIR/rules.conf
    mkdir -p $SIEM_DIR

    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}        SIEM СИСТЕМА         ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Запустить сбор событий"
    echo -e "${GREEN}2)${NC} Показать таймлайн событий"
    echo -e "${GREEN}3)${NC} Анализ паттернов атак"
    echo -e "${GREEN}4)${NC} Настроить правила алертов"
    echo -e "${GREEN}5)${NC} Статистика событий"
    echo -e "${GREEN}6)${NC} Экспорт отчёта"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read SIEMCHOICE

    if [ ! -f "$SIEM_RULES" ]; then
        cat > $SIEM_RULES << 'RULES'
FAILED_LOGIN:Failed password
SUDO_USE:sudo
NEW_PROCESS:execve
PORT_SCAN:SYN
FILE_CHANGE:inotify
RULES
    fi

    case $SIEMCHOICE in
        1)
            echo -e "${YELLOW}==> Запуск SIEM сбора событий... Ctrl+C для остановки${NC}"
            while true; do
                TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

                # Собираем события из journald
                sudo journalctl --since "5 seconds ago" --no-pager 2>/dev/null | while read line; do
                    # Неудачные логины
                    if echo "$line" | grep -qi "failed password\|authentication failure\|invalid user"; then
                        echo "[$TIMESTAMP] [CRITICAL] [AUTH] $line" >> $SIEM_LOG
                        echo -e "${RED}[SIEM] AUTH FAILURE: $line${NC}"
                        notify-send "SIEM ТРЕВОГА" "Неудачная авторизация!" --urgency=critical
                    fi
                    # Sudo использование
                    if echo "$line" | grep -qi "sudo:"; then
                        echo "[$TIMESTAMP] [WARNING] [SUDO] $line" >> $SIEM_LOG
                        echo -e "${YELLOW}[SIEM] SUDO: $line${NC}"
                    fi
                    # Изменения файлов
                    if echo "$line" | grep -qi "FAILED\|error\|critical"; then
                        echo "[$TIMESTAMP] [ERROR] [SYSTEM] $line" >> $SIEM_LOG
                    fi
                done

                # Проверяем сетевые подключения
                NEW_CONNS=$(ss -tnp | grep ESTAB | grep -v "127.0.0.1\|::1")
                if [ ! -z "$NEW_CONNS" ]; then
                    echo "$NEW_CONNS" | while read conn; do
                        echo "[$TIMESTAMP] [INFO] [NETWORK] $conn" >> $SIEM_LOG
                    done
                fi

                # Проверяем новые процессы
                PROC_COUNT=$(ps aux | wc -l)
                if [ -f /tmp/siem_proc_count ]; then
                    OLD_COUNT=$(cat /tmp/siem_proc_count)
                    if [ $PROC_COUNT -gt $(($OLD_COUNT + 3)) ]; then
                        echo "[$TIMESTAMP] [WARNING] [PROCESS] Резкий рост процессов: $OLD_COUNT -> $PROC_COUNT" >> $SIEM_LOG
                        echo -e "${YELLOW}[SIEM] Много новых процессов!${NC}"
                    fi
                fi
                echo $PROC_COUNT > /tmp/siem_proc_count
                sleep 5
            done
            ;;
        2)
            echo -e "${YELLOW}==> Таймлайн событий (последние 50):${NC}"
            tail -50 $SIEM_LOG 2>/dev/null | while read line; do
                if echo "$line" | grep -q "CRITICAL"; then
                    echo -e "${RED}$line${NC}"
                elif echo "$line" | grep -q "WARNING"; then
                    echo -e "${YELLOW}$line${NC}"
                elif echo "$line" | grep -q "ERROR"; then
                    echo -e "${PURPLE}$line${NC}"
                else
                    echo -e "${BLUE}$line${NC}"
                fi
            done
            ;;
        3)
            echo -e "${YELLOW}==> Анализ паттернов атак:${NC}"
            echo -e "${BLUE}Топ IP по неудачным логинам:${NC}"
            grep "AUTH FAILURE\|Failed password" $SIEM_LOG 2>/dev/null | grep -oP '\d+\.\d+\.\d+\.\d+' | sort | uniq -c | sort -rn | head -10

            echo ""
            echo -e "${BLUE}Частота событий по типу:${NC}"
            echo -n "CRITICAL: "; grep -c "CRITICAL" $SIEM_LOG 2>/dev/null || echo 0
            echo -n "WARNING:  "; grep -c "WARNING" $SIEM_LOG 2>/dev/null || echo 0
            echo -n "ERROR:    "; grep -c "ERROR" $SIEM_LOG 2>/dev/null || echo 0
            echo -n "INFO:     "; grep -c "\[INFO\]" $SIEM_LOG 2>/dev/null || echo 0

            echo ""
            echo -e "${BLUE}События за последний час:${NC}"
            HOUR_AGO=$(date -d '1 hour ago' '+%Y-%m-%d %H:%M:%S' 2>/dev/null || date -v-1H '+%Y-%m-%d %H:%M:%S')
            grep -c "" $SIEM_LOG 2>/dev/null || echo "0 событий"

            echo ""
            echo -e "${BLUE}Подозрительные паттерны:${NC}"
            # Bruteforce detection
            BRUTE=$(grep "AUTH FAILURE" $SIEM_LOG 2>/dev/null | wc -l)
            [ $BRUTE -gt 5 ] && echo -e "${RED}ВОЗМОЖНЫЙ БРУТФОРС: $BRUTE неудачных попыток!${NC}"
            ;;
        4)
            echo -e "${YELLOW}==> Текущие правила ($SIEM_RULES):${NC}"
            cat $SIEM_RULES
            echo ""
            echo -e "${GREEN}1)${NC} Добавить правило"
            echo -e "${GREEN}2)${NC} Удалить правило"
            echo -n "Выбор: "
            read RULESCHOICE
            case $RULESCHOICE in
                1)
                    echo -n "Имя правила: "
                    read RNAME
                    echo -n "Паттерн для поиска: "
                    read RPATTERN
                    echo "${RNAME}:${RPATTERN}" >> $SIEM_RULES
                    echo -e "${GREEN}==> Правило добавлено!${NC}"
                    ;;
                2)
                    cat -n $SIEM_RULES
                    echo -n "Номер строки для удаления: "
                    read RNUM
                    sed -i "${RNUM}d" $SIEM_RULES
                    echo -e "${GREEN}==> Удалено!${NC}"
                    ;;
            esac
            ;;
        5)
            echo -e "${YELLOW}==> Статистика SIEM:${NC}"
            echo "Всего событий: $(wc -l < $SIEM_LOG 2>/dev/null || echo 0)"
            echo "Размер лога: $(du -h $SIEM_LOG 2>/dev/null | cut -f1 || echo '0')"
            echo "Первое событие: $(head -1 $SIEM_LOG 2>/dev/null | cut -d']' -f1 | tr -d '[')"
            echo "Последнее событие: $(tail -1 $SIEM_LOG 2>/dev/null | cut -d']' -f1 | tr -d '[')"
            echo ""
            echo -e "${BLUE}По уровням:${NC}"
            for level in CRITICAL WARNING ERROR INFO; do
                COUNT=$(grep -c "$level" $SIEM_LOG 2>/dev/null || echo 0)
                echo "$level: $COUNT"
            done
            ;;
        6)
            REPORT=~/siem-report-$(date '+%Y%m%d-%H%M%S').txt
            echo "SIEM ОТЧЁТ $(date)" > $REPORT
            echo "===================" >> $REPORT
            echo "Всего событий: $(wc -l < $SIEM_LOG 2>/dev/null)" >> $REPORT
            echo "" >> $REPORT
            echo "=== КРИТИЧЕСКИЕ СОБЫТИЯ ===" >> $REPORT
            grep "CRITICAL" $SIEM_LOG 2>/dev/null >> $REPORT
            echo "" >> $REPORT
            echo "=== ПРЕДУПРЕЖДЕНИЯ ===" >> $REPORT
            grep "WARNING" $SIEM_LOG 2>/dev/null >> $REPORT
            echo -e "${GREEN}==> Отчёт: $REPORT${NC}"
            ;;
        0) return ;;
    esac
}

sandbox() {
    SANDBOX_DIR=~/sandbox
    SANDBOX_LOG=$SANDBOX_DIR/sandbox.log
    mkdir -p $SANDBOX_DIR

    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}          SANDBOX            ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Запустить программу в sandbox"
    echo -e "${GREEN}2)${NC} Показать лог поведения"
    echo -e "${GREEN}3)${NC} Анализ системных вызовов"
    echo -e "${GREEN}4)${NC} Мониторинг файловых операций"
    echo -e "${GREEN}5)${NC} Сетевая активность в sandbox"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read SBCHOICE
    case $SBCHOICE in
        1)
            echo -n "Путь к программе: "
            read PROG
            [ ! -f "$PROG" ] && echo -e "${RED}Файл не найден!${NC}" && return
            echo -e "${YELLOW}==> Запуск $PROG в изолированной среде...${NC}"
            TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

            # Запускаем в ограниченном окружении
            echo "[$TIMESTAMP] Запуск: $PROG" >> $SANDBOX_LOG

            # Используем unshare для изоляции namespaces
            if command -v unshare &>/dev/null; then
                echo -e "${YELLOW}Изоляция через Linux namespaces...${NC}"
                sudo unshare --net --pid --fork --mount-proc \
                    strace -f -e trace=file,network,process \
                    -o $SANDBOX_DIR/strace-$(date '+%Y%m%d-%H%M%S').log \
                    "$PROG" 2>/dev/null &
                SANDBOX_PID=$!
                echo -e "${GREEN}==> Запущен! PID: $SANDBOX_PID${NC}"
                echo -e "${YELLOW}Лог syscalls: $SANDBOX_DIR/strace-*.log${NC}"
            else
                # Без unshare но со strace
                strace -f -e trace=file,network,process \
                    -o $SANDBOX_DIR/strace-$(date '+%Y%m%d-%H%M%S').log \
                    "$PROG" 2>/dev/null &
                echo -e "${GREEN}==> Запущен со strace мониторингом!${NC}"
            fi
            ;;
        2)
            echo -e "${YELLOW}==> Лог sandbox:${NC}"
            cat $SANDBOX_LOG 2>/dev/null || echo "Лог пуст"
            echo ""
            echo -e "${YELLOW}==> Strace логи:${NC}"
            ls -lh $SANDBOX_DIR/strace-*.log 2>/dev/null || echo "Нет логов"
            ;;
        3)
            echo -e "${YELLOW}==> Доступные strace логи:${NC}"
            ls $SANDBOX_DIR/strace-*.log 2>/dev/null
            echo -n "Введите путь к лог файлу: "
            read STRACE_LOG
            if [ -f "$STRACE_LOG" ]; then
                echo -e "${BLUE}Файловые операции:${NC}"
                grep -E "open|read|write|unlink|mkdir|chmod" $STRACE_LOG | head -20
                echo ""
                echo -e "${BLUE}Сетевые операции:${NC}"
                grep -E "connect|bind|listen|accept|send|recv" $STRACE_LOG | head -20
                echo ""
                echo -e "${BLUE}Процессные операции:${NC}"
                grep -E "fork|exec|clone|kill|signal" $STRACE_LOG | head -20
            else
                echo -e "${RED}Файл не найден!${NC}"
            fi
            ;;
        4)
            echo -n "Введите путь к файлу/папке для мониторинга: "
            read WATCH_PATH
            [ ! -e "$WATCH_PATH" ] && echo -e "${RED}Путь не найден!${NC}" && return
            if command -v inotifywait &>/dev/null; then
                echo -e "${YELLOW}Мониторинг $WATCH_PATH... Ctrl+C для остановки${NC}"
                inotifywait -m -r --format '%T %w %e %f' --timefmt '%H:%M:%S' "$WATCH_PATH" 2>/dev/null | while read line; do
                    echo -e "${CYAN}$line${NC}"
                    echo "$line" >> $SANDBOX_LOG
                done
            else
                sudo pacman -S inotify-tools --noconfirm
                inotifywait -m -r --format '%T %w %e %f' --timefmt '%H:%M:%S' "$WATCH_PATH" | while read line; do
                    echo -e "${CYAN}$line${NC}"
                    echo "$line" >> $SANDBOX_LOG
                done
            fi
            ;;
        5)
            echo -n "PID процесса для мониторинга: "
            read MON_PID
            echo -e "${YELLOW}Сетевая активность PID $MON_PID... Ctrl+C для остановки${NC}"
            while kill -0 $MON_PID 2>/dev/null; do
                CONNS=$(sudo lsof -p $MON_PID -i 2>/dev/null | tail -n +2)
                if [ ! -z "$CONNS" ]; then
                    echo -e "${CYAN}[$(date '+%H:%M:%S')] $CONNS${NC}"
                    echo "[$(date '+%Y-%m-%d %H:%M:%S')] PID $MON_PID: $CONNS" >> $SANDBOX_LOG
                fi
                sleep 2
            done
            echo -e "${YELLOW}Процесс завершён${NC}"
            ;;
        0) return ;;
    esac
}

anomaly_detector() {
    ANOMALY_DIR=~/anomaly-detector
    BASELINE_FILE=$ANOMALY_DIR/baseline.json
    mkdir -p $ANOMALY_DIR

    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}   ДЕТЕКТОР АНОМАЛИЙ         ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Создать базовый профиль системы"
    echo -e "${GREEN}2)${NC} Запустить мониторинг аномалий"
    echo -e "${GREEN}3)${NC} Показать текущие отклонения"
    echo -e "${GREEN}4)${NC} Статистика нормального поведения"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read ANOMCHOICE
    case $ANOMCHOICE in
        1)
            echo -e "${YELLOW}==> Создание базового профиля системы...${NC}"
            echo -e "${BLUE}Сбор данных (30 секунд)...${NC}"

            CPU_SAMPLES=""
            RAM_SAMPLES=""
            CONN_SAMPLES=""

            for i in $(seq 1 6); do
                CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | tr -d '%us,' | cut -d. -f1)
                RAM=$(free | awk 'NR==2{printf "%.0f", $3*100/$2}')
                CONNS=$(ss -tn | grep ESTAB | wc -l)
                CPU_SAMPLES="$CPU_SAMPLES $CPU"
                RAM_SAMPLES="$RAM_SAMPLES $RAM"
                CONN_SAMPLES="$CONN_SAMPLES $CONNS"
                echo -e "${CYAN}Образец $i/6: CPU=${CPU}% RAM=${RAM}% CONN=${CONNS}${NC}"
                sleep 5
            done

            # Считаем средние значения
            AVG_CPU=$(echo $CPU_SAMPLES | tr ' ' '\n' | awk '{s+=$1; n++} END {printf "%.0f", s/n}')
            AVG_RAM=$(echo $RAM_SAMPLES | tr ' ' '\n' | awk '{s+=$1; n++} END {printf "%.0f", s/n}')
            AVG_CONN=$(echo $CONN_SAMPLES | tr ' ' '\n' | awk '{s+=$1; n++} END {printf "%.0f", s/n}')
            PROC_COUNT=$(ps aux | wc -l)
            OPEN_PORTS=$(ss -tlnp | tail -n +2 | wc -l)

            cat > $BASELINE_FILE << BASELINE
CPU_NORMAL=$AVG_CPU
RAM_NORMAL=$AVG_RAM
CONN_NORMAL=$AVG_CONN
PROC_NORMAL=$PROC_COUNT
PORTS_NORMAL=$OPEN_PORTS
CREATED=$(date '+%Y-%m-%d %H:%M:%S')
BASELINE
            echo -e "${GREEN}==> Профиль создан!${NC}"
            cat $BASELINE_FILE
            ;;
        2)
            [ ! -f "$BASELINE_FILE" ] && echo -e "${RED}Сначала создайте профиль (пункт 1)!${NC}" && return
            source $BASELINE_FILE
            echo -e "${YELLOW}==> Мониторинг аномалий... Ctrl+C для остановки${NC}"
            echo -e "${CYAN}Базовые значения: CPU=${CPU_NORMAL}% RAM=${RAM_NORMAL}% CONN=${CONN_NORMAL}${NC}"

            while true; do
                TIMESTAMP=$(date '+%H:%M:%S')
                CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | tr -d '%us,' | cut -d. -f1)
                RAM=$(free | awk 'NR==2{printf "%.0f", $3*100/$2}')
                CONNS=$(ss -tn | grep ESTAB | wc -l)
                PROCS=$(ps aux | wc -l)
                PORTS=$(ss -tlnp | tail -n +2 | wc -l)

                ANOMALY=0

                # Проверяем отклонения (порог 50%)
                CPU_THRESHOLD=$(( $CPU_NORMAL * 2 ))
                RAM_THRESHOLD=$(( $RAM_NORMAL + 20 ))
                CONN_THRESHOLD=$(( $CONN_NORMAL + 10 ))

                if [ $CPU -gt $CPU_THRESHOLD ]; then
                    echo -e "${RED}[$TIMESTAMP] АНОМАЛИЯ CPU: ${CPU}% (норма ~${CPU_NORMAL}%)${NC}"
                    notify-send "АНОМАЛИЯ" "Высокая нагрузка CPU: ${CPU}%" --urgency=critical
                    ANOMALY=1
                fi
                if [ $RAM -gt $RAM_THRESHOLD ]; then
                    echo -e "${RED}[$TIMESTAMP] АНОМАЛИЯ RAM: ${RAM}% (норма ~${RAM_NORMAL}%)${NC}"
                    notify-send "АНОМАЛИЯ" "Высокое потребление RAM: ${RAM}%" --urgency=critical
                    ANOMALY=1
                fi
                if [ $CONNS -gt $CONN_THRESHOLD ]; then
                    echo -e "${RED}[$TIMESTAMP] АНОМАЛИЯ СЕТЬ: ${CONNS} подключений (норма ~${CONN_NORMAL})${NC}"
                    notify-send "АНОМАЛИЯ" "Много подключений: ${CONNS}" --urgency=critical
                    ANOMALY=1
                fi
                if [ $PORTS -gt $(( $PORTS_NORMAL + 2 )) ]; then
                    echo -e "${RED}[$TIMESTAMP] НОВЫЕ ОТКРЫТЫЕ ПОРТЫ: ${PORTS} (норма ${PORTS_NORMAL})${NC}"
                    notify-send "АНОМАЛИЯ" "Новые открытые порты!" --urgency=critical
                    ANOMALY=1
                fi
                [ $ANOMALY -eq 0 ] && printf "\r${GREEN}[$TIMESTAMP] Норма: CPU=${CPU}%% RAM=${RAM}%% CONN=${CONNS}${NC}    "
                sleep 10
            done
            ;;
        3)
            [ ! -f "$BASELINE_FILE" ] && echo -e "${RED}Сначала создайте профиль!${NC}" && return
            source $BASELINE_FILE
            echo -e "${YELLOW}==> Текущее состояние vs базовый профиль:${NC}"
            CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | tr -d '%us,' | cut -d. -f1)
            RAM=$(free | awk 'NR==2{printf "%.0f", $3*100/$2}')
            CONNS=$(ss -tn | grep ESTAB | wc -l)
            PROCS=$(ps aux | wc -l)
            PORTS=$(ss -tlnp | tail -n +2 | wc -l)

            printf "%-15s %-10s %-10s %s\n" "МЕТРИКА" "ТЕКУЩЕЕ" "НОРМА" "СТАТУС"
            printf "%-15s %-10s %-10s %s\n" "-------" "-------" "-----" "------"

            [ $CPU -gt $(( $CPU_NORMAL * 2 )) ] && STATUS="${RED}АНОМАЛИЯ${NC}" || STATUS="${GREEN}НОРМА${NC}"
            printf "%-15s %-10s %-10s " "CPU" "${CPU}%" "${CPU_NORMAL}%"
            echo -e "$STATUS"

            [ $RAM -gt $(( $RAM_NORMAL + 20 )) ] && STATUS="${RED}АНОМАЛИЯ${NC}" || STATUS="${GREEN}НОРМА${NC}"
            printf "%-15s %-10s %-10s " "RAM" "${RAM}%" "${RAM_NORMAL}%"
            echo -e "$STATUS"

            [ $CONNS -gt $(( $CONN_NORMAL + 10 )) ] && STATUS="${RED}АНОМАЛИЯ${NC}" || STATUS="${GREEN}НОРМА${NC}"
            printf "%-15s %-10s %-10s " "Подключения" "$CONNS" "$CONN_NORMAL"
            echo -e "$STATUS"

            [ $PORTS -gt $(( $PORTS_NORMAL + 2 )) ] && STATUS="${RED}АНОМАЛИЯ${NC}" || STATUS="${GREEN}НОРМА${NC}"
            printf "%-15s %-10s %-10s " "Открытых портов" "$PORTS" "$PORTS_NORMAL"
            echo -e "$STATUS"
            ;;
        4)
            echo -e "${YELLOW}==> Базовый профиль:${NC}"
            cat $BASELINE_FILE 2>/dev/null || echo "Профиль не создан"
            ;;
        0) return ;;
    esac
}

pentest_local() {
    PENTEST_DIR=~/pentest-reports
    mkdir -p $PENTEST_DIR

    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}   ПЕНТЕСТ ЛОКАЛЬНОЙ СЕТИ    ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${RED}ВНИМАНИЕ: Используй только в своей сети!${NC}"
    echo ""
    echo -e "${GREEN}1)${NC} Сканировать локальную сеть"
    echo -e "${GREEN}2)${NC} Сканировать порты хоста"
    echo -e "${GREEN}3)${NC} Проверить дефолтные пароли"
    echo -e "${GREEN}4)${NC} Определить ОС устройств"
    echo -e "${GREEN}5)${NC} Полный отчёт по сети"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read PTCHOICE

    if ! command -v nmap &>/dev/null; then
        echo -e "${YELLOW}Устанавливаем nmap...${NC}"
        sudo pacman -S nmap --noconfirm
    fi

    case $PTCHOICE in
        1)
            SUBNET=$(ip route | grep -v default | grep wlan0 | awk '{print $1}' | head -1)
            [ -z "$SUBNET" ] && SUBNET="192.168.0.0/24"
            echo -e "${YELLOW}==> Сканирование сети $SUBNET...${NC}"
            sudo nmap -sn $SUBNET 2>/dev/null | grep -E "report|MAC|Host"
            ;;
        2)
            echo -n "Введите IP адрес: "
            read TARGET_IP
            echo -e "${YELLOW}==> Сканирование портов $TARGET_IP...${NC}"
            sudo nmap -sV -O --top-ports 1000 $TARGET_IP 2>/dev/null
            ;;
        3)
            echo -n "Введите IP адрес: "
            read TARGET_IP
            echo -e "${YELLOW}==> Проверка дефолтных паролей на $TARGET_IP...${NC}"
            OPEN_PORTS=$(sudo nmap --top-ports 100 $TARGET_IP 2>/dev/null | grep "open" | awk '{print $1}' | cut -d/ -f1)
            for port in $OPEN_PORTS; do
                case $port in
                    22)
                        echo -e "${BLUE}Проверка SSH...${NC}"
                        for cred in "admin:admin" "root:root" "admin:password" "root:toor" "pi:raspberry"; do
                            USER=$(echo $cred | cut -d: -f1)
                            PASS=$(echo $cred | cut -d: -f2)
                            timeout 3 ssh -o StrictHostKeyChecking=no -o ConnectTimeout=2 $USER@$TARGET_IP "exit" 2>/dev/null
                            [ $? -eq 0 ] && echo -e "${RED}УЯЗВИМОСТЬ SSH: $USER:$PASS работает!${NC}"
                        done
                        ;;
                    21)
                        echo -e "${BLUE}Проверка FTP...${NC}"
                        (echo "USER anonymous"; sleep 1; echo "PASS test@test.com"; sleep 1; echo "QUIT") | nc -w 3 $TARGET_IP 21 2>/dev/null | grep -q "230" && echo -e "${RED}УЯЗВИМОСТЬ: FTP анонимный вход работает!${NC}"
                        ;;
                    80|8080)
                        echo -e "${BLUE}Проверка HTTP...${NC}"
                        curl -s -o /dev/null -w "%{http_code}" http://$TARGET_IP:$port/admin 2>/dev/null
                        ;;
                esac
            done
            ;;
        4)
            SUBNET=$(ip route | grep -v default | grep wlan0 | awk '{print $1}' | head -1)
            [ -z "$SUBNET" ] && SUBNET="192.168.0.0/24"
            echo -e "${YELLOW}==> Определение ОС устройств в $SUBNET...${NC}"
            sudo nmap -O $SUBNET 2>/dev/null | grep -E "Nmap scan|OS details|Running:|MAC Address"
            ;;
        5)
            REPORT=$PENTEST_DIR/pentest-$(date '+%Y%m%d-%H%M%S').txt
            SUBNET=$(ip route | grep -v default | grep wlan0 | awk '{print $1}' | head -1)
            [ -z "$SUBNET" ] && SUBNET="192.168.0.0/24"
            echo "PENTEST ОТЧЁТ $(date)" > $REPORT
            echo "Сеть: $SUBNET" >> $REPORT
            echo "===================" >> $REPORT
            echo "=== УСТРОЙСТВА ===" >> $REPORT
            sudo nmap -sn $SUBNET 2>/dev/null >> $REPORT
            echo "=== ОС ===" >> $REPORT
            sudo nmap -O $SUBNET 2>/dev/null | grep -E "report|OS details|Running:" >> $REPORT
            echo -e "${GREEN}==> Отчёт: $REPORT${NC}"
            notify-send "Pentest" "Отчёт по сети сохранён"
            ;;
        0) return ;;
    esac
}

incident_manager() {
    INCIDENT_DIR=~/incidents
    mkdir -p $INCIDENT_DIR

    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}  МЕНЕДЖЕР ИНЦИДЕНТОВ        ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Зарегистрировать инцидент"
    echo -e "${GREEN}2)${NC} Автоматическое реагирование"
    echo -e "${GREEN}3)${NC} Изолировать подозрительный процесс"
    echo -e "${GREEN}4)${NC} Заблокировать IP"
    echo -e "${GREEN}5)${NC} Показать активные инциденты"
    echo -e "${GREEN}6)${NC} Собрать доказательства"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read IMCHOICE
    case $IMCHOICE in
        1)
            INCIDENT_ID="INC-$(date '+%Y%m%d-%H%M%S')"
            echo -n "Описание инцидента: "
            read INCIDENT_DESC
            echo -n "Серьёзность (1-критический, 2-высокий, 3-средний): "
            read SEVERITY
            INCIDENT_FILE="$INCIDENT_DIR/${INCIDENT_ID}.txt"
            cat > $INCIDENT_FILE << INC
ID: $INCIDENT_ID
Время: $(date '+%Y-%m-%d %H:%M:%S')
Описание: $INCIDENT_DESC
Серьёзность: $SEVERITY
Статус: ОТКРЫТ
=== СНАПШОТ СИСТЕМЫ ===
$(ps aux | head -20)
=== СЕТЕВЫЕ ПОДКЛЮЧЕНИЯ ===
$(ss -tnp | grep ESTAB)
=== ПОСЛЕДНИЕ ЛОГИ ===
$(sudo journalctl -n 20 --no-pager 2>/dev/null)
INC
            echo -e "${GREEN}==> Инцидент зарегистрирован: $INCIDENT_ID${NC}"
            notify-send "ИНЦИДЕНТ" "$INCIDENT_ID: $INCIDENT_DESC" --urgency=critical
            ;;
        2)
            echo -e "${YELLOW}==> Автоматическое реагирование...${NC}"
            echo -e "${BLUE}Собираем доказательства...${NC}"
            EVIDENCE_DIR="$INCIDENT_DIR/evidence-$(date '+%Y%m%d-%H%M%S')"
            mkdir -p $EVIDENCE_DIR
            ps aux > $EVIDENCE_DIR/processes.txt
            ss -anp > $EVIDENCE_DIR/network.txt
            sudo journalctl -n 200 --no-pager > $EVIDENCE_DIR/logs.txt 2>/dev/null
            sudo lsof > $EVIDENCE_DIR/open_files.txt 2>/dev/null
            last > $EVIDENCE_DIR/logins.txt
            echo -e "${BLUE}Проверяем подозрительные процессы...${NC}"
            SUSPICIOUS=$(ps aux | awk '$3 > 80 {print $2, $11}')
            if [ ! -z "$SUSPICIOUS" ]; then
                echo -e "${RED}Подозрительные процессы (высокий CPU):${NC}"
                echo "$SUSPICIOUS"
                echo "$SUSPICIOUS" > $EVIDENCE_DIR/suspicious.txt
            fi
            tar -czf "${EVIDENCE_DIR}.tar.gz" "$EVIDENCE_DIR"
            rm -rf $EVIDENCE_DIR
            echo -e "${GREEN}==> Доказательства: ${EVIDENCE_DIR}.tar.gz${NC}"
            ;;
        3)
            echo -n "PID процесса для изоляции: "
            read ISOL_PID
            if kill -0 $ISOL_PID 2>/dev/null; then
                # Снижаем приоритет
                sudo renice 19 $ISOL_PID 2>/dev/null
                # Ограничиваем через cgroup если доступно
                if [ -d /sys/fs/cgroup ]; then
                    sudo cgcreate -g cpu:isolated 2>/dev/null
                    sudo cgset -r cpu.shares=10 isolated 2>/dev/null
                    sudo cgclassify -g cpu:isolated $ISOL_PID 2>/dev/null
                fi
                echo -e "${GREEN}==> Процесс $ISOL_PID изолирован (низкий приоритет)${NC}"
                echo -n "Убить процесс? (y/n): "
                read KILL_CHOICE
                [ "$KILL_CHOICE" == "y" ] && sudo kill -9 $ISOL_PID && echo -e "${RED}==> Процесс убит!${NC}"
            else
                echo -e "${RED}Процесс не найден!${NC}"
            fi
            ;;
        4)
            echo -n "IP для блокировки: "
            read BLOCK_IP
            if command -v iptables &>/dev/null; then
                sudo iptables -A INPUT -s $BLOCK_IP -j DROP
                sudo iptables -A OUTPUT -d $BLOCK_IP -j DROP
                echo -e "${GREEN}==> IP $BLOCK_IP заблокирован через iptables!${NC}"
                echo "[$( date '+%Y-%m-%d %H:%M:%S')] Заблокирован IP: $BLOCK_IP" >> $INCIDENT_DIR/blocked_ips.txt
            else
                echo -e "${RED}iptables недоступен!${NC}"
            fi
            ;;
        5)
            echo -e "${YELLOW}==> Активные инциденты:${NC}"
            ls $INCIDENT_DIR/*.txt 2>/dev/null | while read f; do
                echo -e "${BLUE}---${NC}"
                head -4 "$f"
            done || echo "Инцидентов нет"
            echo ""
            echo -e "${YELLOW}==> Заблокированные IP:${NC}"
            cat $INCIDENT_DIR/blocked_ips.txt 2>/dev/null || echo "Нет"
            ;;
        6)
            echo -e "${YELLOW}==> Сбор доказательств...${NC}"
            EVIDENCE_DIR="$INCIDENT_DIR/evidence-$(date '+%Y%m%d-%H%M%S')"
            mkdir -p $EVIDENCE_DIR
            ps auxf > $EVIDENCE_DIR/processes.txt
            ss -anp > $EVIDENCE_DIR/network.txt
            ip addr > $EVIDENCE_DIR/interfaces.txt
            sudo journalctl -n 500 --no-pager > $EVIDENCE_DIR/logs.txt 2>/dev/null
            sudo lsof > $EVIDENCE_DIR/open_files.txt 2>/dev/null
            last > $EVIDENCE_DIR/logins.txt
            who > $EVIDENCE_DIR/current_users.txt
            crontab -l > $EVIDENCE_DIR/crontab.txt 2>/dev/null
            lsmod > $EVIDENCE_DIR/modules.txt
            find /tmp /var/tmp -type f > $EVIDENCE_DIR/tmp_files.txt 2>/dev/null
            tar -czf "${EVIDENCE_DIR}.tar.gz" "$EVIDENCE_DIR"
            rm -rf $EVIDENCE_DIR
            echo -e "${GREEN}==> Доказательства: ${EVIDENCE_DIR}.tar.gz${NC}"
            notify-send "Инцидент" "Доказательства собраны"
            ;;
        0) return ;;
    esac
}

fim_system() {
    FIM_DIR=~/fim
    FIM_DB=$FIM_DIR/hashes.db
    FIM_LOG=$FIM_DIR/fim.log
    mkdir -p $FIM_DIR

    FIM_PATHS=(
        "/bin"
        "/sbin"
        "/usr/bin"
        "/usr/sbin"
        "/usr/lib"
        "/etc"
        "/boot"
    )

    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}  МОНИТОРИНГ ЦЕЛОСТНОСТИ ФС  ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Создать базу хэшей"
    echo -e "${GREEN}2)${NC} Проверить целостность"
    echo -e "${GREEN}3)${NC} Мониторинг в реальном времени"
    echo -e "${GREEN}4)${NC} Показать изменённые файлы"
    echo -e "${GREEN}5)${NC} Обновить базу хэшей"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read FIMCHOICE
    case $FIMCHOICE in
        1)
            echo -e "${YELLOW}==> Создание базы хэшей системных файлов...${NC}"
            echo -e "${RED}Это займёт несколько минут!${NC}"
            > $FIM_DB
            for path in "${FIM_PATHS[@]}"; do
                echo -e "${BLUE}Хэширование $path...${NC}"
                sudo find $path -type f 2>/dev/null | while read file; do
                    HASH=$(sudo md5sum "$file" 2>/dev/null | awk '{print $1}')
                    [ ! -z "$HASH" ] && echo "$HASH  $file" >> $FIM_DB
                done
            done
            COUNT=$(wc -l < $FIM_DB)
            echo -e "${GREEN}==> База создана: $COUNT файлов хэшировано${NC}"
            ;;
        2)
            [ ! -f "$FIM_DB" ] && echo -e "${RED}Сначала создайте базу (пункт 1)!${NC}" && return
            echo -e "${YELLOW}==> Проверка целостности...${NC}"
            CHANGED=0
            MISSING=0
            while IFS='  ' read -r STORED_HASH FILE; do
                if [ -f "$FILE" ]; then
                    CURRENT_HASH=$(sudo md5sum "$FILE" 2>/dev/null | awk '{print $1}')
                    if [ "$STORED_HASH" != "$CURRENT_HASH" ]; then
                        echo -e "${RED}ИЗМЕНЁН: $FILE${NC}"
                        echo "[$(date '+%Y-%m-%d %H:%M:%S')] ИЗМЕНЁН: $FILE" >> $FIM_LOG
                        CHANGED=$((CHANGED + 1))
                    fi
                else
                    echo -e "${YELLOW}УДАЛЁН: $FILE${NC}"
                    MISSING=$((MISSING + 1))
                fi
            done < $FIM_DB
            echo ""
            echo -e "${YELLOW}Изменено: ${RED}$CHANGED${NC}"
            echo -e "${YELLOW}Удалено: ${RED}$MISSING${NC}"
            [ $CHANGED -eq 0 ] && [ $MISSING -eq 0 ] && echo -e "${GREEN}Целостность не нарушена!${NC}"
            [ $CHANGED -gt 0 ] && notify-send "FIM ТРЕВОГА" "$CHANGED файлов изменено!" --urgency=critical
            ;;
        3)
            echo -e "${YELLOW}Мониторинг изменений... Ctrl+C для остановки${NC}"
            if ! command -v inotifywait &>/dev/null; then
                sudo pacman -S inotify-tools --noconfirm
            fi
            for path in "${FIM_PATHS[@]}"; do
                inotifywait -m -r -e modify,create,delete,move \
                    --format '[%T] %e %w%f' --timefmt '%H:%M:%S' \
                    $path 2>/dev/null | while read line; do
                    echo -e "${RED}FIM: $line${NC}"
                    echo "$line" >> $FIM_LOG
                    notify-send "FIM" "Изменение: $line" --urgency=critical
                done &
            done
            echo -e "${GREEN}==> Мониторинг запущен в фоне!${NC}"
            echo "PIDs: $(jobs -p)"
            ;;
        4)
            echo -e "${YELLOW}==> Зафиксированные изменения:${NC}"
            cat $FIM_LOG 2>/dev/null | tail -50 || echo "Лог пуст"
            ;;
        5)
            [ ! -f "$FIM_DB" ] && echo -e "${RED}Сначала создайте базу!${NC}" && return
            echo -e "${YELLOW}==> Обновление базы хэшей...${NC}"
            > $FIM_DB
            for path in "${FIM_PATHS[@]}"; do
                sudo find $path -type f 2>/dev/null | while read file; do
                    HASH=$(sudo md5sum "$file" 2>/dev/null | awk '{print $1}')
                    [ ! -z "$HASH" ] && echo "$HASH  $file" >> $FIM_DB
                done
            done
            echo -e "${GREEN}==> База обновлена: $(wc -l < $FIM_DB) файлов${NC}"
            ;;
        0) return ;;
    esac
}

malware_analyzer() {
    MALWARE_DIR=~/malware-analysis
    mkdir -p $MALWARE_DIR

    echo -e "${BLUE}==============================${NC}"
    echo -e "${BLUE}    АНАЛИЗАТОР МАЛВАРИ       ${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}1)${NC} Статический анализ файла"
    echo -e "${GREEN}2)${NC} Проверить сигнатуры"
    echo -e "${GREEN}3)${NC} Анализ строк"
    echo -e "${GREEN}4)${NC} Дизассемблирование"
    echo -e "${GREEN}5)${NC} Поведенческий анализ"
    echo -e "${GREEN}6)${NC} Полный отчёт"
    echo -e "${RED}0)${NC} Назад"
    echo -n "Выбор: "
    read MALCHOICE
    case $MALCHOICE in
        1)
            echo -n "Путь к файлу: "
            read MALFILE
            [ ! -f "$MALFILE" ] && echo -e "${RED}Файл не найден!${NC}" && return
            echo -e "${YELLOW}==> Статический анализ $MALFILE...${NC}"
            echo -e "${BLUE}Тип файла:${NC}"
            file "$MALFILE"
            echo ""
            echo -e "${BLUE}Размер и права:${NC}"
            ls -lh "$MALFILE"
            echo ""
            echo -e "${BLUE}MD5/SHA256 хэши:${NC}"
            md5sum "$MALFILE"
            sha256sum "$MALFILE"
            echo ""
            echo -e "${BLUE}ELF информация (если бинарник):${NC}"
            readelf -h "$MALFILE" 2>/dev/null | head -20
            echo ""
            echo -e "${BLUE}Динамические зависимости:${NC}"
            ldd "$MALFILE" 2>/dev/null
            ;;
        2)
            echo -n "Путь к файлу: "
            read MALFILE
            [ ! -f "$MALFILE" ] && echo -e "${RED}Файл не найден!${NC}" && return
            echo -e "${YELLOW}==> Проверка сигнатур...${NC}"
            FILE_HASH=$(md5sum "$MALFILE" | awk '{print $1}')
            echo "MD5: $FILE_HASH"
            echo ""
            echo -e "${BLUE}Известные малварные сигнатуры (базовая проверка):${NC}"
            SUSPICIOUS_STRINGS=("eval\|base64_decode\|exec(" "/bin/sh\|/bin/bash\|cmd.exe" "wget\|curl.*http\|nc -e" "chmod 777\|chmod +x" "rm -rf /\|dd if=" "keylogger\|rootkit\|backdoor")
            FOUND=0
            for pattern in "${SUSPICIOUS_STRINGS[@]}"; do
                RESULT=$(strings "$MALFILE" 2>/dev/null | grep -iE "$pattern")
                if [ ! -z "$RESULT" ]; then
                    echo -e "${RED}ПОДОЗРИТЕЛЬНО [$pattern]:${NC}"
                    echo "$RESULT" | head -3
                    FOUND=1
                fi
            done
            [ $FOUND -eq 0 ] && echo -e "${GREEN}Явных подозрительных сигнатур не найдено${NC}"
            ;;
        3)
            echo -n "Путь к файлу: "
            read MALFILE
            [ ! -f "$MALFILE" ] && echo -e "${RED}Файл не найден!${NC}" && return
            echo -e "${YELLOW}==> Анализ строк...${NC}"
            echo -e "${BLUE}URL и IP адреса:${NC}"
            strings "$MALFILE" 2>/dev/null | grep -E "https?://|[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | head -20
            echo ""
            echo -e "${BLUE}Команды оболочки:${NC}"
            strings "$MALFILE" 2>/dev/null | grep -E "^(bash|sh|cmd|powershell|python|perl|ruby)" | head -10
            echo ""
            echo -e "${BLUE}Файловые пути:${NC}"
            strings "$MALFILE" 2>/dev/null | grep -E "^(/|C:\\\\)" | head -20
            echo ""
            echo -e "${BLUE}Все строки (первые 50):${NC}"
            strings "$MALFILE" 2>/dev/null | head -50
            ;;
        4)
            echo -n "Путь к файлу: "
            read MALFILE
            [ ! -f "$MALFILE" ] && echo -e "${RED}Файл не найден!${NC}" && return
            echo -e "${YELLOW}==> Дизассемблирование...${NC}"
            if command -v r2 &>/dev/null; then
                echo -e "${BLUE}Через radare2:${NC}"
                r2 -A -q -c "pdf @ main" "$MALFILE" 2>/dev/null | head -50
            elif command -v objdump &>/dev/null; then
                echo -e "${BLUE}Через objdump:${NC}"
                objdump -d "$MALFILE" 2>/dev/null | head -50
            else
                echo -e "${YELLOW}Устанавливаем binutils...${NC}"
                sudo pacman -S binutils --noconfirm
                objdump -d "$MALFILE" 2>/dev/null | head -50
            fi
            ;;
        5)
            echo -n "Путь к файлу: "
            read MALFILE
            [ ! -f "$MALFILE" ] && echo -e "${RED}Файл не найден!${NC}" && return
            echo -e "${YELLOW}==> Поведенческий анализ (запуск с мониторингом)...${NC}"
            echo -e "${RED}ВНИМАНИЕ: Файл будет запущен в изолированной среде!${NC}"
            echo -n "Продолжить? (y/n): "
            read CONFIRM
            [ "$CONFIRM" != "y" ] && return
            BEHAV_LOG=$MALWARE_DIR/behavior-$(date '+%Y%m%d-%H%M%S').log
            if ! command -v strace &>/dev/null; then
                sudo pacman -S strace --noconfirm
            fi
            echo -e "${YELLOW}Запуск с strace мониторингом...${NC}"
            timeout 30 strace -f -e trace=file,network,process,signal \
                -o $BEHAV_LOG "$MALFILE" 2>/dev/null &
            STRACE_PID=$!
            sleep 5
            echo -e "${BLUE}Файловые операции:${NC}"
            grep -E "open|write|unlink|mkdir|chmod" $BEHAV_LOG 2>/dev/null | head -15
            echo ""
            echo -e "${BLUE}Сетевые операции:${NC}"
            grep -E "connect|bind|send|recv" $BEHAV_LOG 2>/dev/null | head -10
            echo ""
            echo -e "${BLUE}Процессные операции:${NC}"
            grep -E "fork|exec|clone|kill" $BEHAV_LOG 2>/dev/null | head -10
            wait $STRACE_PID 2>/dev/null
            echo -e "${GREEN}==> Полный лог: $BEHAV_LOG${NC}"
            ;;
        6)
            echo -n "Путь к файлу: "
            read MALFILE
            [ ! -f "$MALFILE" ] && echo -e "${RED}Файл не найден!${NC}" && return
            REPORT=$MALWARE_DIR/malware-report-$(date '+%Y%m%d-%H%M%S').txt
            echo "АНАЛИЗ МАЛВАРИ $(date)" > $REPORT
            echo "Файл: $MALFILE" >> $REPORT
            echo "=========================" >> $REPORT
            echo "=== ТИП ФАЙЛА ===" >> $REPORT
            file "$MALFILE" >> $REPORT
            echo "=== ХЭШИ ===" >> $REPORT
            md5sum "$MALFILE" >> $REPORT
            sha256sum "$MALFILE" >> $REPORT
            echo "=== СТРОКИ ===" >> $REPORT
            strings "$MALFILE" 2>/dev/null >> $REPORT
            echo "=== ЗАВИСИМОСТИ ===" >> $REPORT
            ldd "$MALFILE" 2>/dev/null >> $REPORT
            echo "=== СИГНАТУРЫ ===" >> $REPORT
            strings "$MALFILE" 2>/dev/null | grep -iE "eval|base64|exec|wget|curl|chmod|rm -rf" >> $REPORT
            echo -e "${GREEN}==> Отчёт: $REPORT${NC}"
            notify-send "Малварь" "Анализ завершён"
            ;;
        0) return ;;
    esac
}

# ============ ГЛАВНОЕ МЕНЮ ============

while true; do
    echo ""
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}             ИНСТРУМЕНТЫ               ${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo -e "${GREEN} 1)${NC} Примонтировать флешку"
    echo -e "${GREEN} 2)${NC} Размонтировать флешку"
    echo -e "${GREEN} 3)${NC} Очистка домашней папки"
    echo -e "${GREEN} 4)${NC} Слежка за xfwm4"
    echo -e "${GREEN} 5)${NC} Обновить систему"
    echo -e "${GREEN} 6)${NC} Информация о дисках"
    echo -e "${GREEN} 7)${NC} Сетевая информация"
    echo -e "${PURPLE} 8)${NC} IDS - Мониторинг безопасности"
    echo -e "${PURPLE} 9)${NC} Восстановление системы"
    echo -e "${PURPLE}10)${NC} Анализатор производительности"
    echo -e "${PURPLE}11)${NC} Менеджер конфигураций"
    echo -e "${CYAN}12)${NC} Анализатор трафика"
    echo -e "${CYAN}13)${NC} Сканер уязвимостей"
    echo -e "${CYAN}14)${NC} Шифрование файлов"
    echo -e "${CYAN}15)${NC} Менеджер автозапуска"
    echo -e "${RED}16)${NC} Honeypot"
    echo -e "${RED}17)${NC} Rootkit детектор"
    echo -e "${RED}18)${NC} Анализатор crash дампов"
    echo -e "${RED}19)${NC} Анализатор памяти"
    echo -e "${RED}20)${NC} Детектор руткитов ядра"
    echo -e "${RED}21)${NC} Форензик сборщик"
    echo -e "${RED}22)${NC} Антифишинг монитор"
    echo -e "${YELLOW}23)${NC} SIEM система"
    echo -e "${YELLOW}24)${NC} Sandbox"
    echo -e "${YELLOW}25)${NC} Детектор аномалий"
    echo -e "${YELLOW}26)${NC} Пентест локальной сети"
    echo -e "${YELLOW}27)${NC} Менеджер инцидентов"
    echo -e "${YELLOW}28)${NC} Мониторинг целостности ФС"
    echo -e "${YELLOW}29)${NC} Анализатор малвари"
    echo -e "${RED} 0)${NC} Выход"
    echo -e "${BLUE}========================================${NC}"
    echo -n "Выберите действие: "
    read CHOICE

    case $CHOICE in
        1)
            echo -n "Устройство (Enter для авто): "
            read DEV
            usb_mount mount $DEV
            ;;
        2)  usb_mount umount ;;
        3)  clean_home ;;
        4)  watch_wm ;;
        5)  update_system ;;
        6)  disk_info ;;
        7)  network_info ;;
        8)  ids_monitor ;;
        9)  system_restore ;;
        10) perf_monitor ;;
        11) config_manager ;;
        12) traffic_analyzer ;;
        13) vuln_scanner ;;
        14) file_crypto ;;
        15) autostart_manager ;;
        16) honeypot ;;
        17) rootkit_detector ;;
        18) crash_analyzer ;;
        19) memory_analyzer ;;
        20) kernel_rootkit_detector ;;
        21) forensic_collector ;;
        22) antiphishing_monitor ;;
        23) siem_system ;;
        24) sandbox ;;
        25) anomaly_detector ;;
        26) pentest_local ;;
        27) incident_manager ;;
        28) fim_system ;;
        29) malware_analyzer ;;
        0)
            echo -e "${GREEN}Выход...${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Неверный выбор!${NC}"
            ;;
    esac
done
