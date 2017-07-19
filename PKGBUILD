# Maintainer: Alex Tharp <toastercup@gmail.com>

pkgname=foobar2000-component-audioscrobbler-bin
pkgver=1.4.7
pkgrel=1
pkgdesc="A Last.fm/Audioscrobbler component for foobar2000"
arch=('any')
url="https://www.foobar2000.org/components/view/foo_audioscrobbler"
license=('unknown')
depends=('foobar2000>=1.0.0')
conflicts=('foobar2000-audioscrobbler-bin')
source=("http://download.mp3tag.de/foo_audioscrobbler-1.4.7.zip")
md5sums=('51f9a03adb7cd169ac43d2fc89d544c3')

package() {
	install -Dm644 -t "$pkgdir/usr/share/foobar2000/components" "$srcdir/foo_audioscrobbler.dll"
}
