# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>

pkgname=procs-bin
pkgver=0.10.3
pkgrel=1
pkgdesc="A modern replacement for ps written in Rust"
arch=('x86_64')
url="https://github.com/dalance/procs"
license=('MIT')
provides=("procs")
conflicts=("procs")
source=("https://github.com/dalance/procs/releases/download/v$pkgver/procs-v$pkgver-$arch-lnx.zip")
sha256sums=('c42b42a7b6af508b36b3d2b4418885a05d0fddcae0368d613fabc2f9b5e710e7')

package() {
  install -Dm755 "procs" "$pkgdir/usr/bin/procs"
}
