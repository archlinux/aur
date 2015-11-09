# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Tertia'
pkgname=cinnamon-theme-${_name,,}
pkgver=20151109
pkgrel=1
pkgdesc="${_name} theme for Cinnamon 2.8"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/426"
license=('GPL')
depends=('cinnamon>=2.8.0' 'cinnamon<2.9.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/QKMR-M890-Q4E0.zip")
sha256sums=('6ca62cccdf5d31bc2648773f9a3e4b3cd54c0884e7172e08316ad57dba4858f6')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
