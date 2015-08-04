# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: rcpoison <rc dot poison at gmail dot com>

pkgname=nvenc-api
pkgver="5.0.1"
pkgrel=1
pkgdesc="NVidia NVENC API"
url="https://developer.nvidia.com/nvidia-video-codec-sdk"
arch=('x86_64' 'i686')
license=('proprietary')
depends=('nvidia')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://developer.download.nvidia.com/compute/nvenc/v5.0/nvenc_${pkgver}_sdk.zip")
md5sums=('c26e5d92ab06bac85c03fb4f8595f36b')

build() {
  cd "${srcdir}/nvenc_${pkgver}_sdk"
 
}

package() {
  cd "${srcdir}/nvenc_${pkgver}_sdk"
  mkdir -p "${pkgdir}/usr/include"
  cp -v Samples/common/inc/* $pkgdir/usr/include/
} 
