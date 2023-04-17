# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=pacman-hook-reload-modules
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to invoke systemd-modules-load when its configuration is modified."
arch=("any")
license=("GPL")
depends=('systemd')
url='https://aur.archlinux.org/packages/pacman-hook-reload-modules'
source=(modules-reload.hook)
md5sums=('c60ee68bf22fa7b4d10b7db57d71b854')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/modules-reload.hook" "${pkgdir}/usr/share/libalpm/hooks/95-modules-reload.hook"
}
