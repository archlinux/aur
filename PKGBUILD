# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Tertia'
pkgname=cinnamon-theme-${_name,,}
pkgver=20151229
pkgrel=1
pkgdesc="${_name} theme for Cinnamon 2.8"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/426"
license=('GPL')
depends=('cinnamon>=2.8.0' 'cinnamon<2.9.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/RKSB-NVC1-TTG7.zip")
sha256sums=('204623bc4e6a8b99a8cd3416e9431c479432ef36e1a02e4a023d7e81c8c80c4b')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
