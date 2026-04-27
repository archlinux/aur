# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='curd'
pkgver=1.3.7
pkgrel=1
pkgdesc="Watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler/Recap Skipping, etc."
arch=('x86_64')
url="https://github.com/Wraient/curd"
license=('GPL')
depends=('mpv' 'rofi' 'ueberzugpp')
provides=('curd')
conflicts=('curd')
source=("https://github.com/Wraient/curd/releases/download/v${pkgver}/curd-linux-x86_64")
sha256sums=('e94e917ffb77d23330d0bba028c8faa6b89bed51eaf8de9ac770067e686f926a')

package() {
  install -Dm755 "$srcdir/curd-linux-x86_64" "$pkgdir/usr/bin/curd"
}
