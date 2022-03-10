# Maintainer: Alex Tharp <toastercup@gmail.com>

pkgname=foobar2000-component-vorbisstream-bin
pkgver=1.1
pkgrel=1
pkgdesc="Streams Vorbis and associated metadata to Icecast2 and Shoutcast servers for foobar2000"
arch=('any')
url="https://www.foobar2000.org/components/view/foo_vorbisstream"
license=('unknown')
depends=('foobar2000>=1.0.0')
conflicts=('foobar2000-vorbisstream-bin')
source=("https://www.foobar2000.org/getcomponent/acbe0b662aa2bc0d6f56024d15215d2c/foo_vorbisstream-1.1.zip")
md5sums=('4c12495f8908761db345689e4db31a9d')

package() {
	install -Dm644 -t "$pkgdir/usr/share/foobar2000/components" "$srcdir/foo_vorbisstream.dll"
}
