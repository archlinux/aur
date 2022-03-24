# Maintainer: Kitsu mail@kitsu.me
pkgname=lapce-bin
pkgver=0.0.12
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor written in Rust"
arch=('x86_64')
url="https://github.com/lapce/lapce"
license=('Apache')
depends=('gcc-libs' 'libxcb' 'expat' 'freetype2' 'libxkbcommon')
provides=('lapce')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lapce/lapce/releases/download/v$pkgver/Lapce-linux.tar.gz")
sha256sums=('8419bea746ba775cc5511ac5a6e1b295692fcb569df1af90c355aa2c5c5da285')

package() {
  cd "$srcdir"
  install -Dm755 "Lapce/lapce" "$pkgdir/usr/bin/lapce"
}

