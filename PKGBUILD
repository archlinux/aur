# Maintainer: Leonidas P. <jpegxguy at outlook dot com>

pkgname=audacity-alien
pkgver=3.0.2
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms (patched version from Alien Bob repo due to upstream packaging issues)"
arch=('x86_64' 'i686')
url="https://audacityteam.org"
license=('GPL2' 'CCPL')
depends=('expat' 'gcc-libs' 'soundtouch' 'gdk-pixbuf2' 'glibc' 'libmad' 'libsoxr' 'soundtouch' 'wxgtk3' 'libjpeg6-turbo' 'vamp-plugin-sdk')
optdepends=('ffmpeg: additional import/export capabilities')
provides=("audacity")
conflicts=("audacity")
source_x86_64=("https://slackware.uk/people/alien/sbrepos/current/x86_64/audacity/audacity-${pkgver}-x86_64-1alien.txz"{,.asc})
source_i686=("https://slackware.uk/people/alien/sbrepos/current/x86/audacity/audacity-${pkgver}-i686-1alien.txz"{,.asc})
md5sums_x86_64=("e2f82f1d5505a20c33bc07a918a4038a" "SKIP")
md5sums_i686=("ecf33d113982cd0206d15f5dd80e9181" "SKIP")
validpgpkeys=("F2CE1B92EE1F2C0CE97E581E5E56AAAFA75CBDA0")

package() {
	mkdir -p "${pkgdir}/usr/"
	cp -r "${srcdir}/usr/bin/" "${srcdir}/usr/share/" "${pkgdir}/usr/"
	cp -r "${srcdir}/usr/lib64/" "${pkgdir}/usr/lib/"
	cp -r "${srcdir}/usr/doc/" "${srcdir}/usr/man/" "${pkgdir}/usr/share/"
}
