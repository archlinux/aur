# Maintainer: eeeXun <sdes96303@gmail.com>

pkgname=firtool-bin
pkgver=1.58.0
pkgrel=1
pkgdesc='Circuit IR Compilers and Tools'
url='https://github.com/llvm/circt'
license=('Apache')
source_x86_64=("firtool-${pkgver}-linux-x64.tar.gz::${url}/releases/download/firtool-${pkgver}/firrtl-bin-linux-x64.tar.gz")
arch=('x86_64')
provides=('firtool')
sha256sums_x86_64=('0c555ad1a81ff40eb7b4bb4498bc99d8f88718dc434cf1b178233020a3fa4a9f')

package() {
  install -Dm755 "$srcdir/firtool-$pkgver/bin/firtool" "$pkgdir/usr/bin/firtool"
}
