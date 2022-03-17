# Maintainer: Kitsu mail@kitsu.me
pkgname=lapce-bin
pkgver=0.0.11
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor written in Rust"
arch=('x86_64')
url="https://github.com/lapce/lapce"
license=('Apache')
depends=('gcc-libs' 'libxcb' 'expat' 'freetype2' 'libxkbcommon')
provides=('lapce')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lapce/lapce/releases/download/v$pkgver/Lapce-linux.tar.gz")
sha256sums=('875915c1ef2d046cba54dfa07d3b4299c0f395bf4db964d179f013c0d5b0d8ac')

package() {
  cd "$srcdir"
  install -Dm755 "Lapce/lapce" "$pkgdir/usr/bin/yofi"
}

