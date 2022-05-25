# Maintainer: Bink <unbound-bible-gitwfhu4sip@katink.net>

pkgname=unbound-bible
pkgver=5.3
pkgrel=1
epoch=
pkgdesc="An open source and a free, multilingual Bible-reader program."
arch=('i686' 'x86_64')
url="https://unboundbible.net/"
license=('GPL-3.0')
source_i686=("https://github.com/vrybant/unboundbible/releases/download/v$pkgver/unboundbible_${pkgver}_i386.deb")
source_x86_64=("https://github.com/vrybant/unboundbible/releases/download/v$pkgver/unboundbible_${pkgver}_amd64.deb")
sha256sums_i686=('62d34702cf698173c89c29c914a86af5a623ff11de258a9fb3405fc2f4051168')
sha256sums_x86_64=('8d600f49c484db924c5b3622c57574d938791ca08292c476c9becb338fd4ca9d')

package() {
	tar -xf data.tar.xz -C "${pkgdir}"/
	install -Dm644 "$pkgdir/usr/share/doc/unboundbible/copyright" "$pkgdir/usr/share/licenses/unboundbible/LICENSE"
}
