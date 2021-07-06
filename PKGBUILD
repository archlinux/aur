# Maintainer: Romain Bazile <gromain.baz@gmail.com>


pkgname=flash
pkgver=2.7.2
pkgrel=1
epoch=
pkgdesc="Hypriot flash tool for sd cards."
arch=('x86_64')
url="https://github.com/hypriot/flash"
license=('MIT')
depends=('pv' 'curl' 'hdparm' 'unzip' 'python-pip')
source=("https://github.com/hypriot/flash/releases/download/${pkgver}/${pkgname}")
sha256sums=('94dab725e4839ac7ef9254ce7f9bd96791089d6aa98495e23826845ed256427f')

package() {
        install -D -m751 ${srcdir}/flash ${pkgdir}/usr/local/bin/flash;
}

