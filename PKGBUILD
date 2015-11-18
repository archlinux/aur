# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Tertia'
pkgname=cinnamon-theme-${_name,,}
pkgver=20151115
pkgrel=1
pkgdesc="${_name} theme for Cinnamon 2.8"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/426"
license=('GPL')
depends=('cinnamon>=2.8.0' 'cinnamon<2.9.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/RN59-O608-2YIZ.zip")
sha256sums=('44efcb1985f63bda14d5ea4b9f0052feaffebd568c7c202d51c0d19e7391df5d')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
