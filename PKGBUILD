# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=bibata-cursor-theme-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Material Based Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("${pkgname%-bin}-$pkgver.tar.gz::$url/releases/download/v$pkgver/Bibata.tar.gz")
sha256sums=('70dfc4a251227adfba73d1a7a0db8721b9f5dd5cab47143b438fb40741c8cd28')

package() {
  install -d "$pkgdir/usr/share/icons"
  cp -r Bibata*  "$pkgdir/usr/share/icons"
}
