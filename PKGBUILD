# Maintainer: Vinny Meller (vinnymeller@gmail.com)
pkgname="pulseaudio-nextsink"
pkgver="2.0.0"
pkgrel="2"
pkgdesc="Swaps audio sink to the next in the list via pactl"
arch=("x86_64")
url="https://www.github.com/vinnymeller/pulseaudio-nextsink"
depends=('pulseaudio' 'bash')
source=("pulseaudio-nextsink")
sha512sums=("5d9bd183ecc7da0c258870c683071e799c245ba92a2b1a33510fe0c9a4eaa50a12d928f672e3345c801f430ed98a7094a12c3fe16d47352245b51e91e00b84fe")

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/pulseaudio-nextsink" "${pkgdir}/usr/bin/pulseaudio-nextsink"
	chmod +x "${pkgdir}/usr/bin/pulseaudio-nextsink"
}
