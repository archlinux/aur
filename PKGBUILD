# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>

pkgname=procs-bin
pkgver=0.10.5
pkgrel=1
pkgdesc="A modern replacement for ps written in Rust"
arch=('x86_64')
url="https://github.com/dalance/procs"
license=('MIT')
provides=("procs")
conflicts=("procs")
source=("https://github.com/dalance/procs/releases/download/v$pkgver/procs-v$pkgver-$arch-lnx.zip")
sha256sums=('03c25cd7cbae9359c4aa15a25c3df3ecfa2ac6f9bce0e08946239fab2621d39b')

package() {
  install -Dm755 "procs" "$pkgdir/usr/bin/procs"
}
