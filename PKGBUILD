# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>

pkgname=procs-bin
pkgver=0.10.4
pkgrel=1
pkgdesc="A modern replacement for ps written in Rust"
arch=('x86_64')
url="https://github.com/dalance/procs"
license=('MIT')
provides=("procs")
conflicts=("procs")
source=("https://github.com/dalance/procs/releases/download/v$pkgver/procs-v$pkgver-$arch-lnx.zip")
sha256sums=('e43e35c05b79475677342d2906e2454ac881cbf4ad04dbc9741262a9e53c0a89')

package() {
  install -Dm755 "procs" "$pkgdir/usr/bin/procs"
}
