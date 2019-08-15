# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer: kia hamedi <kia.arta9793@gmail.com>
pkgname=zirnevis
pkgver=1.0.0
pkgrel=1
pkgdesc="Open source application for download subtitle only by movie name"
arch=('any')
url="https://github.com/kiahamedi/zirnevis"
license=('GPL3')
depends=('wget' 'python' 'python-pyqt5' 'python-requests' 'qt5-svg' 'python-beautifulsoup4')
checkdepends=()
optdepends=()
install=
changelog=
source=(${pkgname}-${pkgver}.zip::https://github.com/kiahamedi/zirnevis/archive/master.zip)

package() {
  unzip -p ${pkgname}-${pkgver}.zip zirnevis-master/zirnevis > zirnevis
  install -D -t "$pkgdir/usr/bin" "$srcdir/zirnevis"
  install -D -t "$pkgdir/usr/share/icons/" "$srcdir/zirnevis-master/zirnevis-icon.png"
  install -D -t "$pkgdir/usr/share/applications/" "$srcdir/zirnevis-master/zirnevis.desktop"
}

md5sums=('022055e5f120b45c9a30cbe3b96a15d2')
