. /usr/lib/gpio-present.sh

check_gpio_bus_configuration () {
    ERRORS=0
    shift;
    if ! gpio_present $1; then
        echo "SDA GPIO ($1) not detected" >&2
        ERRORS="$(($ERRORS+1))"
    fi
    shift;
    if ! gpio_present $1; then
        echo "SCL GPIO ($1) not detected" >&2
        ERRORS="$(($ERRORS+1))"
    fi
    return "$ERRORS"
}
