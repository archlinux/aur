# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>

pkgname=procs-bin
pkgver=0.9.16
pkgrel=1
pkgdesc="A modern replacement for ps written in Rust"
arch=('x86_64')
url="https://github.com/dalance/procs"
license=('MIT')
provides=("procs")
conflicts=("procs")
source=("https://github.com/dalance/procs/releases/download/v$pkgver/procs-v$pkgver-$arch-lnx.zip")
sha256sums=('a4e21dbd89837fe0443ef99bfe9c6410c15cb1f8ac5351e2a10c844862bf3f16')

package() {
  install -Dm755 "procs" "$pkgdir/usr/bin/procs"
}
