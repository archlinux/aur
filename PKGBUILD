# Maintainer: Kitsu mail@kitsu.me
pkgname=lapce-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor written in Rust"
arch=('x86_64')
url="https://github.com/lapce/lapce"
license=('Apache')
depends=('gcc-libs' 'fontconfig' 'libxcb' 'zlib')
provides=('lapce')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lapce/lapce/releases/download/v$pkgver/Lapce-linux.tar.gz")
sha256sums=('d6eff0bb895fa907a82a9b8f9fddbcf215d69e65bebca28e7a6fb65fa9f70b1e')

package() {
  cd "$srcdir"
  install -Dm755 "Lapce/lapce" "$pkgdir/usr/bin/lapce"
}

