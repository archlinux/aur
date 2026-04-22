# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='curd'
pkgver=1.3.4
pkgrel=1
pkgdesc="Watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler/Recap Skipping, etc."
arch=('x86_64')
url="https://github.com/Wraient/curd"
license=('GPL')
depends=('mpv' 'rofi' 'ueberzugpp')
provides=('curd')
conflicts=('curd')
source=("https://github.com/Wraient/curd/releases/download/v${pkgver}/curd-linux-x86_64")
sha256sums=('9c0b3ccd76f55473f31d0fe904874010fd3a21612704a07133ee859341fddacd')

package() {
  install -Dm755 "$srcdir/curd-linux-x86_64" "$pkgdir/usr/bin/curd"
}
