# Run croco hooks related commands.

Lsb_release() {
    sed -i /etc/lsb-release \
        -e 's,DISTRIB_ID=.*,DISTRIB_ID=Croco,' \
        -e 's,DISTRIB_RELEASE=.*,DISTRIB_RELEASE=Soaring,' \
        -e 's,DISTRIB_DESCRIPTION=.*,DISTRIB_DESCRIPTION=\"Croco OS\",'
        
}

Os_release() {
    sed -i /usr/lib/os-release \
        -e 's,NAME=.*,NAME=\"Croco OS\",' \
        -e 's,PRETTY_NAME=.*,PRETTY_NAME=\"Croco OS\",' \
        -e 's,ID=.*,ID=croco,' \
        -e 's,ID_LIKE=.*,ID_LIKE=arch,' \
        -e 's,BUILD_ID=.*,BUILD_ID=rolling,' \
        -e 's,HOME_URL=.*,HOME_URL=\"https://crocolinux.org/\",' \
        -e 's,DOCUMENTATION_URL=.*,DOCUMENTATION_URL=\"https://wiki.crocolinux.org/\",' \
        -e 's,SUPPORT_URL=.*,SUPPORT_URL=\"https://forum.crocolinux.org/\",' \
        -e 's,BUG_REPORT_URL=.*,BUG_REPORT_URL=\"https://gitlab.com/groups/croco-os/\",' \
        -e 's,LOGO=.*,LOGO=crocolinux,'
}

Issues() {
    sed -i 's|Arch|Croco|g' /etc/issue /usr/share/factory/etc/issue
}

Fix_nsswitch() {
    sed -i 's|systemd||g' /etc/nsswitch.conf && sed -i 's|hosts:.*|hosts: files mymachines myhostname mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] dns wins|g' /etc/nsswitch.conf
}

Fix_pacman() {
    sed -i 's|Server = http://lonewolf-builder.duckdns.org/$repo/x86_64|Include = /etc/pacman.d/chaotic-mirrorlist|g' /etc/pacman.conf
    sed -i 's|Server = http://chaotic.bangl.de/$repo/x86_64||g' /etc/pacman.conf
    sed -i 's|Server = https://repo.kitsuna.net/x86_64||g' /etc/pacman.conf
    sed -i 's|Server = http://lonewolf-ipfs.pedrohlc.com/$repo/x86_64||g' /etc/pacman.conf
    sed -i 's|Server = https://chaotic.tn.dedyn.io/x86_64||g' /etc/pacman.conf
}

Grub-btrfs() {
    sed -i /etc/default/grub-btrfs/config \
        -e 's,.*GRUB_BTRFS_SUBMENUNAME=.*,GRUB_BTRFS_SUBMENUNAME=\"Croco OS snapshots\",'
    sed -i /usr/lib/systemd/system/grub-btrfs.path \
        -e 's,.*PathModified=.*,PathModified=/run/timeshift/backup/timeshift-btrfs/snapshots,'
}
Pamac-fix() {
zcat /usr/share/app-info/xmls/community.xml.gz | sed 's|<em>||g;s|<\/em>||g;' | gzip > "new.xml.gz"
   cp new.xml.gz /usr/share/app-info/xmls/community.xml.gz
   appstreamcli refresh-cache --force
}

os-prober_fix() {
/usr/bin/grub-fix-initrd-generation
}

nohang_fix() {
    sed -i 's|zram_checking_enabled = False|zram_checking_enabled = True|g' /etc/nohang/nohang-desktop.conf
}

timeshift_fix() {
sed -i 's|"btrfs_mode" : "false",|"btrfs_mode" : "true",|g' /etc/timeshift/default.json
}


limits_fix() {
sed -i /etc/systemd/system.conf \
        -e 's,.*DefaultLimitNOFILE=.*,DefaultLimitNOFILE=1048576,' \
        -e 's,.*DefaultTimeoutStopSec=.*,DefaultTimeoutStopSec=30s,'
        
sed -i /etc/systemd/user.conf \
        -e 's,.*DefaultLimitNOFILE=.*,DefaultLimitNOFILE=1048576,' \
        -e 's,.*DefaultTimeoutStopSec=.*,DefaultTimeoutStopSec=30s,'
}

btrfs_commit_fix() {
sed -i 's|,commit=120||g' /etc/fstab
}

post_install() {
post_upgrade
}

post_upgrade() {
Lsb_release
Os_release
Issues
Fix_nsswitch
Fix_pacman
Grub-btrfs
Pamac-fix
os-prober_fix
nohang_fix
timeshift_fix
limits_fix
btrfs_commit_fix
}
