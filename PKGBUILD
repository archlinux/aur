# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=bibata-cursor-theme-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Material Based Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("${pkgname%-bin}-$pkgver.tar.gz::$url/releases/download/v$pkgver/Bibata.tar.gz")
sha256sums=('57138081f3dc15980fcd86d559db8e62867ca9ac93efe74971b27af28e4e7ba2')

package() {
  install -d "$pkgdir/usr/share/icons"
  cp -r Bibata*  "$pkgdir/usr/share/icons"
}
