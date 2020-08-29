# This is a configuration file add extra variables to
# be used by build_rootfs() from rootfs_lib.sh the variables will be
# loaded just before call the function. For more information see the
OS_NAME="Arch Linux"
OS_VERSION="${OS_VERSION:-latest}"
PACKAGES="systemd"  # iptables, udev and libseccomp are part of base

# Init process must be one of {systemd,kata-agent}
#[ "${AGENT_INIT}" = "yes" ] && INIT_PROCESS="kata-agent" || INIT_PROCESS="systemd"
#[ "${AGENT_INIT}" = "no" ] && INIT_PROCESS="systemd" || INIT_PROCESS="kata-agent"
INIT_PROCESS=systemd

# List of zero or more architectures to exclude from build,
# as reported by  `uname -m`
ARCH_EXCLUDE_LIST=()  # untested

# Allow the build to fail without generating an error.
# For more info see: https://github.com/kata-containers/osbuilder/issues/190
BUILD_CAN_FAIL=1
