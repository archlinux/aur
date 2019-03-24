# Maintainer: Romain Bazile <gromain.baz@gmail.com>


pkgname=flash
pkgver=2.3.0
pkgrel=1
epoch=
pkgdesc="Hypriot flash tool for sd cards."
arch=('x86_64')
url="https://github.com/hypriot/flash"
license=('MIT')
depends=('pv' 'curl' 'hdparm' 'unzip' 'python-pip')
source=("https://github.com/hypriot/flash/releases/download/${pkgver}/${pkgname}")
sha1sums=('e91393750c423737506782dc12c93ea46b58979b')

package() {
        install -D -m751 ${srcdir}/flash ${pkgdir}/usr/local/bin/flash;
}

