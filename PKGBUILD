# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bibata-cursor-theme-bin
pkgver=2.0.6
pkgrel=1
pkgdesc="Material Based Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("${pkgname%-bin}-$pkgver.tar.xz::$url/releases/download/v$pkgver/Bibata.tar.xz")
sha256sums=('88252b36063a85e8f2123502917c7e64296a94290d08731884625d7436bd24cb')

package() {
  install -d "$pkgdir/usr/share/icons"
  cp -r Bibata* "$pkgdir/usr/share/icons"
}
