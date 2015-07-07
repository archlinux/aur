# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Tertia'
pkgname=cinnamon-theme-${_name,,}
pkgver=20150707
pkgrel=1
pkgdesc="${_name} theme for Cinnamon 2.6"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/426"
license=('GPL')
depends=('cinnamon>=2.6.0' 'cinnamon<2.7.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/7T4D-OSWS-VKRR.zip")
sha256sums=('56b77b1fd236bec6e25ee976945c31bbb37ed105a5c717fe38c91fd0e165162c')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
