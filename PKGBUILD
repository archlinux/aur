# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>

pkgname=procs-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A modern replacement for ps written in Rust"
arch=('x86_64')
url="https://github.com/dalance/procs"
license=('MIT')
provides=("procs")
conflicts=("procs")
source=("https://github.com/dalance/procs/releases/download/v$pkgver/procs-v$pkgver-$arch-lnx.zip")
sha256sums=('e3512ae9f3ce8addba67f489eb96570577ffcb96f37a29c1a0beaab4725f4ff5')

package() {
  install -Dm755 "procs" "$pkgdir/usr/bin/procs"
}
