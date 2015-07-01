#!/bin/bash

build() {
    add_checked_modules '/drivers/net/'
    add_module aoe

    add_binary "/usr/sbin/aoe-interfaces" "/bin/aoe-interfaces"
    add_binary "/usr/sbin/aoe-discover" "/bin/aoe-discover"
    add_binary "/usr/sbin/aoeping" "/bin/aoeping"

    add_runscript
}

help() {
    cat <<HELPEOF
This hook loads the necessary modules for a network device.
Detection will take place at runtime. To minimize the modules
in the image, add the autodetect hook too.
For pcmcia net devices please use pcmcia hook too.

Kernel Parameters:

BOOTIF=01-<bootif-mac>
aoe_iflist=<iface>[,<iface>...]
aoe_discover_timeout=<discover-timeout>
root=/dev/etherd/e<shelf>.<slot>[p<part>

If neither BOOTIF=... nor aoe_iflist=... are specified, all available
network interfaces will be brought up and made available for AoE.
Depending on network infrastructure, this may pose a security risk,
but it is useful for testing.

If only BOOTIF=... is specified, the associated network interface will
be made available for AoE.

When using PXELINUX as bootloader, the line 'IPAPPEND 2' can be added
to its configuration file to have the BOOTIF parameter added to the
kernel commandline automatically, based on information from DHCP.

If aoe_iflist=... is specified, it will override any network interface
determined by the BOOTIF=... parameter.

<bootif-mac>        MAC address of the network interface used for
                    booting.
<iface>             Name of a network interface to bring up and make
                    available for AoE device discovery.
<discover-timeout>  Time (in seconds) to wait for discovery of the
                    AoE root device. Defaults to 10 seconds.
<shelf>             As specified in the AoE device configuration.
<slot>              As specified in the AoE device configuration.
<part>              Partition on an AoE device. Use this only if
                    the device containins a partition table.
HELPEOF
}

# vim: set ft=sh ts=4 sw=4 et:
