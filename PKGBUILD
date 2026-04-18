# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='curd'
pkgver=1.3.3
pkgrel=1
pkgdesc="Watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler/Recap Skipping, etc."
arch=('x86_64')
url="https://github.com/Wraient/curd"
license=('GPL')
depends=('mpv' 'rofi' 'ueberzugpp')
provides=('curd')
conflicts=('curd')
source=("https://github.com/Wraient/curd/releases/download/v${pkgver}/curd-linux-x86_64")
sha256sums=('b009df16e9debdb8af2a16771be5a438d4dadbcfe5e14309adf959724fca1750')

package() {
  install -Dm755 "$srcdir/curd-linux-x86_64" "$pkgdir/usr/bin/curd"
}
