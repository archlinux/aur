# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>

_gemname=video_transcoding
pkgname=ruby-$_gemname
pkgver=2025.01.28
pkgrel=1
pkgdesc='Tools to transcode, inspect and convert videos.'
arch=('any')
url='https://github.com/lisamelton/video_transcoding'
license=(MIT)
depends=('ruby' 'mkvtoolnix-cli' 'ffmpeg')
source=(https://github.com/lisamelton/$_gemname/archive/refs/tags/$pkgver.tar.gz)
sha1sums=('9b952c7c6e6c88dc15165e0d0bb249832374667c')

package() {
  cd "$srcdir/$_gemname-$pkgver"
  install -Dm755 convert-video.rb "$pkgdir/usr/local/bin/convert-video.rb"
  install -Dm755 detect-crop.rb "$pkgdir/usr/local/bin/detect-crop.rb"
  install -Dm755 transcode-video.rb "$pkgdir/usr/local/bin/transcode-video.rb"
}
