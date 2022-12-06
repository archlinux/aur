# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=bibata-cursor-theme-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="Material Based Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("${pkgname%-bin}-$pkgver.tar.gz::$url/releases/download/v$pkgver/Bibata.tar.gz")
sha256sums=('1664a1e848707e643362eb772a38f077a4cac6362ca39f5705f59e85128b270c')

package() {
  install -d "$pkgdir/usr/share/icons"
  cp -r Bibata* "$pkgdir/usr/share/icons"
}
