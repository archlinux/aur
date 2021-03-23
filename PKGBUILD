# Maintainer: Leonidas P. <jpegxguy at outlook dot com>

pkgname=audacity-alien
pkgver=3.0.0
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms (patched version from Alien Bob repo due to upstream packaging issues)"
arch=('x86_64' 'i686')
url="https://audacityteam.org"
license=('GPL2' 'CCPL')
depends=('expat' 'gcc-libs' 'soundtouch' 'gdk-pixbuf2' 'glibc' 'libmad'
'libsoxr' 'soundtouch' 'wxgtk3')
optdepends=('ffmpeg: additional import/export capabilities')
provides=("audacity")
conflicts=("audacity")
source_x86_64=("https://slackware.nl/people/alien/slackbuilds/audacity/pkg64/current/audacity-${pkgver}-x86_64-1alien.txz"{,.asc})
source_i686=("https://slackware.nl/people/alien/slackbuilds/audacity/pkg/current/audacity-${pkgver}-i686-1alien.txz"{,.asc})
sha256sums_x86_64=("1e711113c6c9b4aea1c3294193d2187d2a6077c633fd2435da12f5709d12e5a8" "SKIP")
sha256sums_i686=("1e711113c6c9b4aea1c3294193d2187d2a6077c633fd2435da12f5709d12e5a8" "SKIP")
validpgpkeys=("F2CE1B92EE1F2C0CE97E581E5E56AAAFA75CBDA0")

package() {
	mkdir -p "${pkgdir}/usr/"
	cp -r "${srcdir}/usr/bin/" "${srcdir}/usr/share/" "${pkgdir}/usr/"
	cp -r "${srcdir}/usr/lib64/" "${pkgdir}/usr/lib/"
	cp -r "${srcdir}/usr/doc/" "${srcdir}/usr/man/" "${pkgdir}/usr/share/"
}
