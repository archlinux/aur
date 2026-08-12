# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=diskonaut
pkgname=diskonaut-kfkonrad-bin
pkgver=1.0.2
pkgrel=1
pkgdesc=" Terminal disk space navigator (kfknrad fork) (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/kfkonrad/diskonaut"
license=('MIT')
depends=()
provides=("diskonaut=$pkgver")
conflicts=(diskonaut)
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/kfkonrad/$_pkgname/releases/download/v$pkgver/diskonaut_${pkgver}_x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::https://github.com/kfkonrad/$_pkgname/releases/download/v$pkgver/diskonaut_${pkgver}_aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('0fb059502bc63b0ca8486c67ee954132ad5e2742eab800c582853db4193e754a')
sha256sums_aarch64=('a86858f2c9fc7fe66f9335670449ee2a9bbd99b1a86ae36053233c40f9980a3c')
options=('!debug')

package() {
  cd "$srcdir"

  # Install binary
  install -Dm755 "diskonaut" "$pkgdir/usr/bin/diskonaut"
}
