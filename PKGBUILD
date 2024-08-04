# Maintainer: eeeXun <sdes96303@gmail.com>

pkgname=firtool-bin
pkgver=1.80.0
pkgrel=1
pkgdesc='Circuit IR Compilers and Tools'
url='https://github.com/llvm/circt'
license=('Apache')
source_x86_64=("firtool-${pkgver}-linux-x64.tar.gz::${url}/releases/download/firtool-${pkgver}/firrtl-bin-linux-x64.tar.gz")
arch=('x86_64')
provides=('firtool')
sha256sums_x86_64=('c8fcf463adcabe9e15f5fd952735a8e12eb0e7b32aeafb71a8d5dcef12fe57f8')

package() {
  install -Dm755 "$srcdir/firtool-$pkgver/bin/firtool" "$pkgdir/usr/bin/firtool"
}
