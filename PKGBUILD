# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='curd'
pkgver=2.0.0
pkgrel=1
pkgdesc="Watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler/Recap Skipping, etc."
arch=('x86_64')
url="https://github.com/Wraient/curd"
license=('GPL')
depends=('mpv' 'rofi' 'ueberzugpp')
provides=('curd')
conflicts=('curd')
source=("https://github.com/Wraient/curd/releases/download/v${pkgver}/curd-linux-x86_64")
sha256sums=('da9c4f328876b0c887ae67e4cd308fc91a7a31527ebb69ce39d595cae601c930')

package() {
  install -Dm755 "$srcdir/curd-linux-x86_64" "$pkgdir/usr/bin/curd"
}
