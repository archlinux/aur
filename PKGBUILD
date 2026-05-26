# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='curd'
pkgver=1.5.2
pkgrel=1
pkgdesc="Watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler/Recap Skipping, etc."
arch=('x86_64')
url="https://github.com/Wraient/curd"
license=('GPL')
depends=('mpv' 'rofi' 'ueberzugpp')
provides=('curd')
conflicts=('curd')
source=("https://github.com/Wraient/curd/releases/download/v${pkgver}/curd-linux-x86_64")
sha256sums=('c61360f3a915f98a03be229e07507108b05465c84c7ee205a1c0098b9d189da3')

package() {
  install -Dm755 "$srcdir/curd-linux-x86_64" "$pkgdir/usr/bin/curd"
}
