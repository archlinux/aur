# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=systemd-boot-pacman-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to upgrade systemd-boot after systemd upgrade."
arch=("any")
license=("GPL")
source=(systemd-boot.hook)
md5sums=("29f602ed5702c18f68eb7c2d293af04f")

package() {
    install -m755 -d "${pkgdir}/etc/pacman.d/hooks"
    install -m644 "${srcdir}/systemd-boot.hook" "${pkgdir}/etc/pacman.d/hooks/systemd-boot.hook"
}
