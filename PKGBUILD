# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=bibata-cursor-theme-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Material Based Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL3')
depends=('libxcursor' 'libpng')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("${pkgname%-bin}-$pkgver.tar.gz::$url/releases/download/v$pkgver/Bibata.tar.gz")
sha256sums=('69dabbd1d289b01a482e5efc2c6d24b9bb96b9d53e9b345db4e02e02a6322fef')

package() {
  install -d "$pkgdir/usr/share/icons"
  cp -r Bibata*  "$pkgdir/usr/share/icons"
}
