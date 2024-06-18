# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bibata-cursor-theme-bin
pkgver=2.0.7
pkgrel=1
pkgdesc="Material Based Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("${pkgname%-bin}-$pkgver.tar.xz::$url/releases/download/v$pkgver/Bibata.tar.xz")
sha256sums=('172e33c4ae415278384dcecc7d1a9b7a024266bc944bc751fd86532be1cc6251')

package() {
  install -d "$pkgdir/usr/share/icons"
  cp -r Bibata* "$pkgdir/usr/share/icons"
}
