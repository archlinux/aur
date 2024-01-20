# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bibata-cursor-theme-bin
pkgver=2.0.5
pkgrel=1
pkgdesc="Material Based Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("${pkgname%-bin}-$pkgver.tar.xz::$url/releases/download/v$pkgver/Bibata.tar.xz")
sha256sums=('378b75247f080829e525d7736bc108e29f0bf0a769e816eea7099885fa812686')

package() {
  install -d "$pkgdir/usr/share/icons"
  cp -r Bibata* "$pkgdir/usr/share/icons"
}
