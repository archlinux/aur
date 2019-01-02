# Maintainer: Jaden Peterson <jadenpeterson150@gmail.com>

pkgname=sfml-bin
pkgver=2.5.1
pkgrel=1
pkgdesc='The Simple and Fast Multimedia Library'
arch=('x86_64')
url='https://www.sfml-dev.org/'
license=('custom')
depends=('flac' 'freetype2' 'graphite' 'libglvnd' 'libvorbis' 'libxrandr' 'openal' 'pcre')

provides=("sfml=${pkgver}")
conflicts=('sfml')

source=("https://www.sfml-dev.org/files/SFML-${pkgver}-linux-gcc-64-bit.tar.gz" 'LICENSE')
sha256sums=('SKIP' 'SKIP')

package() {
	cp -r "SFML-${pkgver}" "${pkgdir}/usr"
	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/sfml/LICENSE"
}
