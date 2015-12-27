# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Prima'
pkgname=cinnamon-theme-${_name,,}
pkgver=20151227
pkgrel=1
pkgdesc="${_name} theme for Cinnamon 2.8"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/323"
license=('GPL')
depends=('cinnamon>=2.8.0' 'cinnamon<2.9.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/L2H9-QNMN-HVIZ.zip")
sha256sums=('ad8a455d9ec13909d516eb77e94e2b3318a30a65478bf12ca27c2fcfcea2eaae')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
