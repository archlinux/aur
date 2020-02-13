# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>

pkgname=procs-bin
pkgver=0.9.9
pkgrel=1
pkgdesc="A modern replacement for ps written in Rust"
arch=('x86_64')
url="https://github.com/dalance/procs"
license=('MIT')
provides=("procs")
conflicts=("procs")
source=("https://github.com/dalance/procs/releases/download/v$pkgver/procs-v$pkgver-$arch-lnx.zip")
sha256sums=('e8a613b089e1ef62d7ac0dcd9afffb9961350cf8772374e6cb5cd49deeddb07b')

package() {
  install -Dm755 "procs" "$pkgdir/usr/bin/procs"
}
