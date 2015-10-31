# Maintainer: John Ackerman <afuturepilotis at gmail dot com>
pkgname='ambiance-radiance-flat-colors-suite'
pkgver='15.10.2'
pkgrel=1
pkgdesc="A Modern, Beautiful and Vivid Re-imagination of the Ambiance & Radiance Color GTK 2/3 Themes."
arch=('any')
license=('GPL2')
options=('!strip' '!zipman')
url="http://www.ravefinity.com/p/download-ambiance-radiance-flat-colors.html"
depends=('gtk3>=3.14' 'gtk-engine-murrine')
optdepends=('vibrancy-colors')
source=("$pkgname-$pkgver.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QAWFFnVzRvSWFzUDg")
md5sums=('236c21b008752c70f047bbcbe529f74d')

package() {
  	mkdir -p "$pkgdir/usr/share/themes/"
	cd "$srcdir/"
	cp -r Ambiance-* Radiance-* "$pkgdir/usr/share/themes/"
}
