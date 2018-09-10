# Maintainer: Anton Karmanov <bergentroll@insiberia.net>

pkgname=sound-theme-smooth
pkgver=1.1
pkgrel=2
pkgdesc="Complete system sound theme with 58 event sounds."
arch=("any")
url="https://www.xfce-look.org/p/1187979/"
license=('combined free')
provides=('sound-theme-freedesktop')
source=("https://www.dropbox.com/s/f65axtt6vclx3xo/Smooth.tar.gz")
md5sums=('e98c5c3d9120004e0833fced2651b5d3')

package() {
	cd ${srcdir}

	install -dm755 "${pkgdir}/usr/share/sounds/Smooth"
	install -dm755 "${pkgdir}/usr/share/sounds/Smooth/stereo"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"

	install -m644 Smooth/documentation/* \
		"${pkgdir}/usr/share/doc/${pkgname}"

	install -m644 Smooth/index.theme "${pkgdir}/usr/share/sounds/Smooth"
	install -m644 Smooth/stereo/* \
		"${pkgdir}/usr/share/sounds/Smooth/stereo"
}
