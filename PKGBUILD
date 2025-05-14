# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=qtgmc
pkgver=3.386
pkgrel=1
pkgdesc='A very high quality deinterlacer with a range of features for both quality and convenience.'
arch=(any)
license=(None)
url='http://avisynth.nl/index.php/QTGMC'
depends=(
	'python-scipy'
	'vapoursynth-plugin-havsfunc-git'
	'vapoursynth-miscfilters-obsolete-git'
	'vapoursynth-plugin-mvtools-git'
	'vapoursynth-plugin-fft3dfilter-git'
	'vapoursynth-plugin-znedi3-git'
	'vapoursynth-plugin-eedi3m-git'
	'vapoursynth-plugin-removegrain-git'
	'vapoursynth-plugin-resize2-git'
)
source=(
	"https://github.com/realfinder/AVS-Stuff/raw/master/avs%202.6%20and%20up/QTGMC.avsi"
	"qtgmc.vpy"
)
sha256sums=(
	"a5cdd524be9196b9af197560844309ace6205ec40116637781983e71267d825e"
	"SKIP"
)

package() {
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	cp "${srcdir}/QTGMC.avsi" "${pkgdir}/usr/share/${pkgname}/"

	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/qtgmc.vpy" "${pkgdir}/usr/bin/"
}
