# Maintainer: Kitsu mail@kitsu.me
pkgname=lapce-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor written in Rust"
arch=('x86_64')
url="https://github.com/lapce/lapce"
license=('Apache')
depends=('gcc-libs' 'fontconfig' 'libxcb' 'zlib')
provides=('lapce')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lapce/lapce/releases/download/v$pkgver/Lapce-linux.tar.gz")
sha256sums=('c18bb7238f8991cb1b1ffc7b8be3dd9e46b46fb9bfb0fe6b9dc986795572b688')

package() {
  cd "$srcdir"
  install -Dm755 "Lapce/lapce" "$pkgdir/usr/bin/lapce"
}

