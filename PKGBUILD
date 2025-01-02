# Maintainer: Ryan Jensen  -  jensenR30 at gmail dot com
pkgname=audio-files-thumbnailer-git
pkgver=0.1
pkgrel=1
arch=(any)
pkgdesc="Adds thumbnailer config for some audio files"
url="https://github.com/jensenr30/audio-files-thumbnailer"
license=('0BSD')
depends=('ffmpeg')
makedepends=('git')
source=("https://raw.githubusercontent.com/jensenr30/audio-files-thumbnailer/refs/heads/main/audio-files.thumbnailer")
md5sums=("SKIP")

package() {
	file='audio-files.thumbnailer'
	install -Dm644 "$srcdir/$file" "$pkgdir/usr/share/thumbnailers/$file"
}
