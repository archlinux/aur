#!/bin/bash

/usr/bin/rm /usr/lib/cni/firewall && /usr/bin/ln -s cni-nftables-firewall /usr/lib/cni/firewall
/usr/bin/rm /usr/lib/cni/portmap && /usr/bin/ln -s cni-nftables-portmap /usr/lib/cni/portmap
/usr/bin/rm /opt/cni/bin/firewall && /usr/bin/ln -s cni-nftables-firewall /opt/cni/bin/firewall
/usr/bin/rm /opt/cni/bin/portmap && /usr/bin/ln -s cni-nftables-portmap /opt/cni/bin/portmap
