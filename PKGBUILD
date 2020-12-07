# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>

pkgname=procs-bin
pkgver=0.10.10
pkgrel=1
pkgdesc="A modern replacement for ps written in Rust"
arch=('x86_64')
url="https://github.com/dalance/procs"
license=('MIT')
provides=("procs")
conflicts=("procs")
source=("https://github.com/dalance/procs/releases/download/v$pkgver/procs-v$pkgver-$arch-lnx.zip")
sha256sums=('29cb4fdd955a352e1ed534736271b7cfed9af4df41c7dbde2d0f06ff1bf035b1')

package() {
  install -Dm755 "procs" "$pkgdir/usr/bin/procs"
}
