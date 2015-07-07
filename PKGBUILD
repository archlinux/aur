# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Secunda'
pkgname=cinnamon-theme-${_name,,}
pkgver=20150707
pkgrel=1
pkgdesc="${_name} theme for Cinnamon 2.6"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/411"
license=('GPL')
depends=('cinnamon>=2.6.0' 'cinnamon<2.7.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/UCHO-EGIM-QVO8.zip")
sha256sums=('1d0c66e01f01b134e1f84c4fbb87e31675b648ccbaab461e0e10413f52a626ab')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
