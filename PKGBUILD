# Mantainer: 3ED <krzysztof1987 at gmail>

pkgname=flv2x264
pkgver=0.2.a1
pkgrel=1
pkgdesc="flv to avi converter"
arch=('any')
license=('GPL2')
depends=('ffmpeg' 'bash')
optdepends=('libx264: h264 support'
            'libtheora: ogg/theora support'
            'libvpx: vp8 support'
            'faac: aac support'
            'libvorbis: ogg/vorbis support'
            'lame: mp3 support')
url="https://github.com/3ed/flv2x264"
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/3ed/flv2x264/archive/v${pkgver}.tar.gz)
sha256sums=('14f7e252d6c0234f7d508d3bbb21a43e99fdb60c1294ee2203c1ab1bea6f71d0')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -dm755 "$pkgdir/usr/bin"
  install -m0755 bin/flv2x264 "$pkgdir/usr/bin/flv2x264"
}
