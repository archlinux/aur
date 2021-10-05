# Maintainer: Vinny Meller (vinnymeller@gmail.com)
pkgname="pulseaudio-nextsink"
pkgver="2.0.0"
pkgrel="1"
pkgdesc="Swaps audio sink to the next in the list via pactl"
arch=("x86_64")
url="https://www.github.com/vinnymeller/pulseaudio-nextsink"
depends=('pulseaudio' 'bash')
source=("pulseaudio-nextsink")
sha512sums=("6aa6ea6ee52ab2e80a18446c7999b0866a6b6c4a55c91c84287c042e07313c7b408e1fac74385409281a215a258f2b72b66773b2ad5765b7b15bc087dcf75eda")

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/pulseaudio-nextsink" "${pkgdir}/usr/bin/pulseaudio-nextsink"
	chmod +x "${pkgdir}/usr/bin/pulseaudio-nextsink"
}
