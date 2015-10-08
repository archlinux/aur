pkgname=lego-udev-rules
pkgver=1
pkgrel=1
pkgdesc='udev rules for the lego nxt'
arch=('any')
license=('GPL')
url='http://aur.archlinux.org/'
source=('70-lego.rules')
md5sums=('329cacca92908fc61137e308969a0760')

install=${pkgname}.install

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/etc/udev/rules.d || return 1
    install -m644 -t ${pkgdir}/etc/udev/rules.d \
        ${srcdir}/70-lego.rules || return 1
}
