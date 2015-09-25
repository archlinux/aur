# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Prima'
pkgname=cinnamon-theme-${_name,,}
pkgver=20150925
pkgrel=1
pkgdesc="${_name} theme for Cinnamon 2.6"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/323"
license=('GPL')
depends=('cinnamon>=2.6.0' 'cinnamon<2.7.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/7BTX-5Z3T-VYRH.zip")
sha256sums=('b76699adf9a779e93af17877662d2c6f55f6d9e4c5998b78ed2e36f47440eb0c')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
