post_install() {
    echo "/sys/kernel/debug/sched needs to exist for CFS tuning to succeed"
    echo "Make sure CONFIG_SCHED_DEBUG is enabled in your kernel config if this is absent"

    echo "This package builds a bpf module against the linux-headers on your install"
    echo "hopefully these headers are applicable to running kernel(s) you have in play"
}
