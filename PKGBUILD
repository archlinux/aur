# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Prima'
pkgname=cinnamon-theme-${_name,,}
pkgver=20151109
pkgrel=1
pkgdesc="${_name} theme for Cinnamon 2.8"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/323"
license=('GPL')
depends=('cinnamon>=2.8.0' 'cinnamon<2.9.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/J46G-LK45-QWJR.zip")
sha256sums=('ace0a10201c70b5051ebc9f92d8b79beb04dde45101260162b4defdbaafdd907')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
