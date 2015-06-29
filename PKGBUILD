# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Secunda'
pkgname=cinnamon-theme-${_name,,}
pkgver=20150624
pkgrel=3
pkgdesc="${_name} theme for Cinnamon 2.6"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/411"
license=('GPL')
depends=('cinnamon>=2.6.0' 'cinnamon<2.7.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/DKC0-D6WT-MA4P.zip")
sha256sums=('680b05a40fe83bc6e70cefcc01d107e23f4e0d3e5ce0c0dcdc94edd985d651e6')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
