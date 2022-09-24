# Maintainer: Ameya Shenoy <shenoy.ameya@gmail.com>
pkgname=gobang-bin
pkgver=0.1.0
subver=alpha.5
pkgrel=1
pkgdesc='A cross-platform TUI database management tool written in Rust'
url='https://github.com/TaKO8Ki/gobang'
arch=('x86_64')
source=("$pkgname-$pkgver-$subver.tar.gz::$url/releases/download/v$pkgver-$subver/${pkgname%-bin}-$pkgver-$subver-x86_64-unknown-linux-musl.tar.gz")
license=('MIT')
sha256sums=('29b8f517937cf19691c6e594a0789fe80a528fff05c346883af0e2950b9b90ef')

package() {
  cd "${pkgname%-bin}-$pkgver-$subver-$arch-unknown-linux-musl"
  install -Dm755 gobang "${pkgdir}/usr/bin/gobang"
}
