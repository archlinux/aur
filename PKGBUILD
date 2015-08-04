# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: rcpoison <rc dot poison at gmail dot com>

pkgname=nvenc-api
pkgver="5.0.1"
pkgrel=1
pkgdesc="The NVENC Video Encoding API provides an interface to video encoder hardware on supported NVIDIA GPUs"
url="https://developer.nvidia.com/nvidia-video-codec-sdk"
arch=('x86_64' 'i686')
license=('custom')
depends=('nvidia')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://developer.download.nvidia.com/compute/nvenc/v5.0/nvenc_${pkgver}_sdk.zip"
"LICENSE")
sha256sums=('0e9c575b4cf94bda3ae22cfaa4ce9eb931e566cc2046c3db63b92cbda5edf22d'
            'c5ab6e526631d3e32e0a6912d6c2565303f5c787cf7a141370081ebaaf93acd2')

build() {
  cd "${srcdir}/nvenc_${pkgver}_sdk"
 
}

package() {
  cd "${srcdir}/nvenc_${pkgver}_sdk"
  install -Dm644 Samples/common/inc/* $pkgdir/usr/include/
  install -Dm644 "$srcdir/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
