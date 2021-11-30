# Maintainer: crab2313 <crab2313@gmail.com>

pkgname=gnome-shell-caps-pacman-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to set CAP_SYS_NICE for gnome-shell executable"
arch=("any")
license=("GPL")
depends=('gnome-shell' 'libcap')
source=(gnome-shell-caps.hook)
sha256sums=('e2beb32d7d8cfb645a0f2501c933ee682bf5dfa9b0486938ac2d36c566be1baa')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/gnome-shell-caps.hook" "${pkgdir}/usr/share/libalpm/hooks/95-gnome-shell-caps.hook"
}
