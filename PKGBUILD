# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Secunda'
pkgname=cinnamon-theme-${_name,,}
pkgver=20151011
pkgrel=2
pkgdesc="${_name} theme for Cinnamon 2.6"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/411"
license=('GPL')
depends=('cinnamon>=2.6.0' 'cinnamon<2.7.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/UXQK-016Q-KMKF.zip")
sha256sums=('98bcbcac26d9ec8f8c0be71d9a156234d86d887ff2b1e4c6b4a1e619321386e8')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
