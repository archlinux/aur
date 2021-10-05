# Maintainer: Vinny Meller (vinnymeller@gmail.com)
pkgname="pulseaudio-nextsink"
pkgver="2.0.0"
pkgrel="1"
pkgdesc="Swaps audio sink to the next in the list via pactl"
arch=("x86_64")
url="https://www.github.com/vinnymeller/pulseaudio-nextsink"
depends=('pulseaudio' 'bash')
source=("pulseaudio-nextsink")
sha512sums=("28840b89153bd72f9a0d1376c2165d782830f4a9817ce89d107850e76d29048f9b92436dca78829c36a535d3d31292312839e15ef087ef697da0d84517484210")

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/pulseaudio-nextsink" "${pkgdir}/usr/bin/pulseaudio-nextsink"
	chmod +x "${pkgdir}/usr/bin/pulseaudio-nextsink"
}
