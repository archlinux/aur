# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Secunda'
pkgname=cinnamon-theme-${_name,,}
pkgver=20151011
pkgrel=1
pkgdesc="${_name} theme for Cinnamon 2.6"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/411"
license=('GPL')
depends=('cinnamon>=2.6.0' 'cinnamon<2.7.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/2IAC-YHRB-DAUX.zip")
sha256sums=('563e5c326cbd0bda12e45134bb164685dfd6b97b4d06bddc22815487771e1f10')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
