# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>

pkgname=procs-bin
pkgver=0.10.9
pkgrel=1
pkgdesc="A modern replacement for ps written in Rust"
arch=('x86_64')
url="https://github.com/dalance/procs"
license=('MIT')
provides=("procs")
conflicts=("procs")
source=("https://github.com/dalance/procs/releases/download/v$pkgver/procs-v$pkgver-$arch-lnx.zip")
sha256sums=('84243f7feb7b9fa26f495e2be0701b6c10a0535cdbd74e6ce8d241a9aa66afff')

package() {
  install -Dm755 "procs" "$pkgdir/usr/bin/procs"
}
