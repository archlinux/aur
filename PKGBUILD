# Maintainer: Romain Bazile <romain.bazile@ubiant.com>


pkgname=flash
pkgver=1
pkgrel=1
epoch=
pkgdesc="Hypriot flash tool for sd cards."
arch=('x86_64')
url="https://github.com/hypriot/flash"
license=('MIT')
depends=('pv' 'curl' 'hdparm' 'unzip' 'python-pip')
source=("https://raw.githubusercontent.com/hypriot/flash/master/Linux/flash")
sha1sums=('0182b262a6618667a2d0cfd57a955048a22b13bb')

package() {
        chmod +x ${srcdir}/flash;
        install -D -m644 ${srcdir}/flash ${pkgdir}/usr/local/bin/flash;
}
