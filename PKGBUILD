# Maintainer: Marco Steiger <marco1steiger (at) gmail (dot) com>
pkgname=ffmpegthumbnailer-mp3
pkgver=1.1
pkgrel=1
pkgdesc="A very simple integration of ffmpeg to generate thumbnails from mp3(audio/mpeg) files"
url="https://github.com/Marco98/ffmpegthumbnailer-mp3"
depends=('ffmpeg')
makedepends=('git')
arch=('any')
source=('git+https://github.com/Marco98/ffmpegthumbnailer-mp3.git#tag=v1.1')
md5sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/share/thumbnailers"
	cp "$srcdir/ffmpegthumbnailer-mp3/ffmpegthumbnailer-mp3.thumbnailer" "$pkgdir/usr/share/thumbnailers/ffmpegthumbnailer-mp3.thumbnailer"
}
