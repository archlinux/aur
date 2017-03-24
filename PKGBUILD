# Maintainer: Romain Bazile <gromain.baz@gmail.com>


pkgname=flash
pkgver=1.6.0
pkgrel=2
epoch=
pkgdesc="Hypriot flash tool for sd cards."
arch=('x86_64')
url="https://github.com/hypriot/flash"
license=('MIT')
depends=('pv' 'curl' 'hdparm' 'unzip' 'python-pip')
source=("https://raw.githubusercontent.com/hypriot/flash/master/Linux/flash")
sha1sums=('fd5254662842ae07ec92196b3d0f787b2133640e')

package() {
        install -D -m751 ${srcdir}/flash ${pkgdir}/usr/local/bin/flash;
}

