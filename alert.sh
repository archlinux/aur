#!/bin/bash

# تنظیمات هشدار
VOLUME="100%"
FLASH_DELAY="0.07"
WARNING_MSG="ALERT!"
ALERT_FILE="/usr/share/alert/alert1.mp3"  # مسیر فایل صوتی را بررسی کنید

# تنظیمات اولیه
BACKLIGHT_PATH="/sys/class/backlight/*/brightness"
original_brightness=$(cat $BACKLIGHT_PATH 2>/dev/null || echo "")
original_volume=$(amixer -D pulse get Master | grep -oP '\d+%' | head -1 || echo "80%")

# تابع بازگردانی تنظیمات
cleanup() {
    # پایان دادن به تمام فرایندهای مرتبط
    kill -9 "$ALERT_PID" 2>/dev/null
    killall mplayer 2>/dev/null    # اطمینان از پایان mplayer
    kill "$FLASH_PID" 2>/dev/null

    # بازگردانی تنظیمات سیستم
    amixer -D pulse sset Master "$original_volume" >/dev/null 2>&1
    [ -n "$original_brightness" ] && echo "$original_brightness" | sudo tee $BACKLIGHT_PATH >/dev/null 2>&1

    # پاکسازی ترمینال
    printf '\e[0m\e[2J\e[H'
    stty sane
    exit 0
}

trap cleanup EXIT INT TERM

# تنظیم ماکسیمم صدا و نور
amixer -D pulse sset Master "$VOLUME" >/dev/null 2>&1
[ -n "$original_brightness" ] && echo $(cat ${BACKLIGHT_PATH%%/*}/max_brightness) | sudo tee $BACKLIGHT_PATH >/dev/null 2>&1

# تابع چشمک زدن صفحه
flash_screen() {
    while :; do
        printf '\e[48;5;196m\e[2J\e[H'
        sleep "$FLASH_DELAY"
        printf '\e[48;5;15m\e[2J\e[H'
        sleep "$FLASH_DELAY"
    done
}

# تابع پخش هشدار صوتی (نسخه بهبود یافته)
play_alert() {
    # استفاده از پخش کننده با قابلیت کنترل PID
    mplayer -really-quiet -loop 0 "$ALERT_FILE" >/dev/null 2>&1 &
    ALERT_PID=$!
    wait "$ALERT_PID"  # منتظر ماندن برای اتمام فرایند
}

# شروع هشدارها
flash_screen &
FLASH_PID=$!
play_alert &

# نمایش پیام و انتظار برای فشار کلید
echo -e "\e[1;31m=== EMERGENCY ALARM ACTIVATED ===\e[0m"
read -sn1 -p $'\e[1;31mPRESS ANY KEY TO SILENCE\e[0m'

# تمیزکاری و خروج
cleanup
