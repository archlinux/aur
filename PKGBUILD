# Maintainer: Romain Bazile <gromain.baz@gmail.com>


pkgname=flash
pkgver=2.7.0
pkgrel=1
epoch=
pkgdesc="Hypriot flash tool for sd cards."
arch=('x86_64')
url="https://github.com/hypriot/flash"
license=('MIT')
depends=('pv' 'curl' 'hdparm' 'unzip' 'python-pip')
source=("https://github.com/hypriot/flash/releases/download/${pkgver}/${pkgname}")
sha1sums=('5a41c48aa73586cf62e3bc909cb95c9b02f2d135')

package() {
        install -D -m751 ${srcdir}/flash ${pkgdir}/usr/local/bin/flash;
}

