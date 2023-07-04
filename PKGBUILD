# Maintainer: Ayatale <ayatale8@gmail.com>

pkgname="xfwm4-theme-border-only"
pkgver=0.1.0
pkgrel=1
url="https://www.xfce-look.org/p/1016214"
pkgdesc="Who needs a title/buttons bar? This xfwm theme only displays a 2px border."
arch=('any')
license=('GPL2')
depends=('xfwm4')
source=("140039-border-only.tar.gz")
sha256sums=('8e7304ee205b640f213a641155a9348ec6235481aeeddfd5f588041682b44535')

package() {
    mkdir -p "${pkgdir}/usr/share/themes/"
    cp -ar --no-preserve=ownership "${srcdir}/border-only" "${pkgdir}/usr/share/themes/border-only"
}
