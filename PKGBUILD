# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>

pkgname=procs-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="A modern replacement for ps written in Rust"
arch=('x86_64')
url="https://github.com/dalance/procs"
license=('MIT')
provides=("procs")
conflicts=("procs")
source=("https://github.com/dalance/procs/releases/download/v$pkgver/procs-v$pkgver-$arch-lnx.zip")
sha256sums=('af327478cd1d944ce8880866a832bad682e372ce0500a3a0520ab9ae06005f5e')

package() {
  install -Dm755 "procs" "$pkgdir/usr/bin/procs"
}
