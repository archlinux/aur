# Contributor: Jake <aur at ja-ke dot tech>
pkgname=nwjs-ffmpeg-codecs-bin
pkgver=0.102.0
pkgrel=1
_avcodec=62
pkgdesc="Add codecs to Chromium M138+ (libavcodec ${_avcodec})"
arch=('x86_64')
optdepends=(nwjs vivaldi vivaldi-snapshot)
url=https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt
license=('LGPL2.1')
source=("${url}/releases/download/${pkgver}/${pkgver}-linux-x64.zip")
sha256sums=('a3d5eca356d145f18985fd1c7d64b5b12e8536e825d5b6c8dbb2739f5617a8dc')

package() {
  install -Dvm644 libffmpeg.so "$pkgdir"/usr/lib/libffmpeg.so.$_avcodec
}
