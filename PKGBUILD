# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>

pkgname=procs-bin
pkgver=0.10.8
pkgrel=1
pkgdesc="A modern replacement for ps written in Rust"
arch=('x86_64')
url="https://github.com/dalance/procs"
license=('MIT')
provides=("procs")
conflicts=("procs")
source=("https://github.com/dalance/procs/releases/download/v$pkgver/procs-v$pkgver-$arch-lnx.zip")
sha256sums=('4bf628e6c9898d49582a6e1b6a45a7839b3a303b8e3ac1d12443eb889846dbec')

package() {
  install -Dm755 "procs" "$pkgdir/usr/bin/procs"
}
