# Maintainer: Rick Stanley <rick {hyphen} stanley {at} outlook[dot] com>

pkgname=webgpu-headers
pkgver=64aeb86b69
pkgrel=1
pkgdesc="WebGPU native header files"
arch=(any)
url="https://github.com/webgpu-native/webgpu-headers/"
license=("BSD")
source=("https://github.com/webgpu-native/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e339a47c516d07a6aac93159d59f8c8b17c8c5d0866de0a21364411b2593e585')

package() {
  install -dm0755 "${pkgdir}/usr/include/webgpu"

  cd $pkgname-$pkgver*

  cp -a --no-preserve=ownership "webgpu.h" "${pkgdir}/usr/include/webgpu"
}

