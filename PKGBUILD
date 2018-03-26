# Maintainer: Romain Bazile <gromain.baz@gmail.com>


pkgname=flash
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="Hypriot flash tool for sd cards."
arch=('x86_64')
url="https://github.com/hypriot/flash"
license=('MIT')
depends=('pv' 'curl' 'hdparm' 'unzip' 'python-pip')
source=("https://raw.githubusercontent.com/hypriot/flash/${pkgver}/${pkgname}")
sha1sums=('249695b11f5c6b6a07a5c3f759673986f8e2f6fc')

package() {
        install -D -m751 ${srcdir}/flash ${pkgdir}/usr/local/bin/flash;
}

