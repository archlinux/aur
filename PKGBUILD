# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Tertia'
pkgname=cinnamon-theme-${_name,,}
pkgver=20150624
pkgrel=3
pkgdesc="${_name} theme for Cinnamon 2.6"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/426"
license=('GPL')
depends=('cinnamon>=2.6.0' 'cinnamon<2.7.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/RVE9-WY8V-QNTF.zip")
sha256sums=('36e690604a555a358aff80cd18da84121959376a7131f0554292efd004adbb01')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
