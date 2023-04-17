# Maintainer: Your Name <youremail@domain.com>

pkgname=mkinitcpio-sd-zfs-rename
pkgver=0.1.0
pkgrel=3
pkgdesc='This module renames the zfs filesystem declared in (zpool get) bootfs, if the name ends with "_next_boot", by removing the "_next_boot" part from the filesystem name/path'
arch=('any')
url='https://aur.archlinux.org/packages/mkinitcpio-sd-zfs-rename'
license=('BSD0')
groups=()
depends=('systemd')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
options=()
source=(
    'sd-zfs-rename'
    'sd-zfs-rename.service'
    'sd-zfs-rename.sh'
)
noextract=()
sha256sums=(
    '3c9084e898cf131e9863edaeb1c96c24c1157b6dcc3abf555816ce486b682657'
    '0140033eec7956cf95ea8c803fc5cef00b277206f0cf9a693951d965f42867d6'
    '82a51a18b24eead51db114fd23e740ab7e8038d6c513ae3c1df3896b46c1afa2'
)


package() {
    install -Dm644 "sd-zfs-rename" "${pkgdir}/usr/lib/initcpio/install/sd-zfs-rename"
    install -Dm644 "sd-zfs-rename.service" "${pkgdir}/usr/lib/systemd/system/sd-zfs-rename.service"
    install -Dm755 "sd-zfs-rename.sh" "${pkgdir}/usr/lib/mkinitcpio-sd-zfs-rename/sd-zfs-rename.sh"
}

