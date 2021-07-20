# Maintainer: Romain Bazile <gromain.baz@gmail.com>


pkgname=flash
pkgver=2.7.2
pkgrel=2
epoch=
pkgdesc="Hypriot flash tool for sd cards."
arch=('x86_64')
url="https://github.com/hypriot/flash"
license=('MIT')
depends=('pv' 'curl' 'hdparm' 'unzip' 'python-pip')
source=("https://github.com/hypriot/flash/releases/download/${pkgver}/${pkgname}")
sha256sums=('571d9e6424b275859a9273029a2321245888ab201dbae1a3ec57a6ef708adce1')

package() {
        install -D -m755 ${srcdir}/flash ${pkgdir}/usr/local/bin/flash;
}

