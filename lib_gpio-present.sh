gpio_present() {
    for CHIP in /sys/class/gpio/gpiochip*; do
        if [ -d "$CHIP" ]; then
            BASE=`cat "$CHIP/base" || true`
            NGPIO=`cat "$CHIP/ngpio" || true`
            if [ -n "$BASE" ] && [ -n "$NGPIO" ] && [ "$1" -ge "$BASE" ] && [ "$1" -lt "$(($BASE+$NGPIO))" ]; then
                return 0
            fi
        fi
    done
    return 1
}
