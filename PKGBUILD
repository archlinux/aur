# Maintainer: Anton Karmanov <bergentroll@insiberia.net>

pkgname=sound-theme-smooth
pkgver=0
pkgrel=1
pkgdesc="Complete system sound theme with 58 event sounds."
arch=("any")
url="https://www.xfce-look.org/p/1187979/"
license=('combined free')
provides=('sound-theme-freedesktop')
source=("http://www50.zippyshare.com/d/lZRoF8FZ/5952/Smooth.tar.gz")
md5sums=('32d2cdd06b1b4e479cf4299380e5cc6f')

package() {
	cd ${srcdir}

	install -dm755 "${pkgdir}/usr/share/sounds/Smooth"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"

	install -m644 Smooth/stereo/documentation/* \
		"${pkgdir}/usr/share/doc/${pkgname}"
	rm -rf Smooth/stereo/documentation

	cp -r Smooth "${pkgdir}/usr/share/sounds/"
}
