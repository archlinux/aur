# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>

_gemname=other_video_transcoding
pkgname=ruby-$_gemname
pkgver=2025.01.21
pkgrel=2
pkgdesc='Other Video Transcoding is a package of tools to transcode videos.'
arch=('any')
url='https://github.com/lisamelton/other_video_transcoding'
license=(MIT)
depends=('ruby' 'mkvtoolnix-cli' 'ffmpeg')
source=(https://github.com/lisamelton/$_gemname/archive/refs/tags/$pkgver.tar.gz)
sha1sums=('966bd3c84e888e4dcd146e96f997ffb5703d5cfb')

package() {
  cd "$srcdir/$_gemname-$pkgver"
  install -Dm755 other-transcode.rb "$pkgdir/usr/local/bin/other-transcode.rb"
}

