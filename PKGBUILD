# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bibata-cursor-theme-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="Material Based Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("${pkgname%-bin}-$pkgver.tar.xz::$url/releases/download/v$pkgver/Bibata.tar.xz")
sha256sums=('af21e99d6bdda372e24ed8734f21e9fd6f09fcf9d6f1f47d0043dcd8c1e00959')

package() {
  install -d "$pkgdir/usr/share/icons"
  cp -r Bibata* "$pkgdir/usr/share/icons"
}
