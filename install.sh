post_install() {
    echo "/sys/kernel/debug/sched needs to exist for CFS tuning to succeed"
    echo "Make sure CONFIG_SCHED_DEBUG is enabled in your kernel config if this is absent"
}
