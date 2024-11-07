# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=qtgmc
pkgver=3.384
pkgrel=1
pkgdesc='A very high quality deinterlacer with a range of features for both quality and convenience.'
arch=(any)
license=(None)
url='http://avisynth.nl/index.php/QTGMC'
depends=(
	'vapoursynth-plugin-havsfunc-git'
	'vapoursynth-miscfilters-obsolete-git'
	'vapoursynth-plugin-mvtools-git'
	'vapoursynth-plugin-fft3dfilter-git'
	'vapoursynth-plugin-znedi3-git'
	'vapoursynth-plugin-eedi3m-git'
	'vapoursynth-plugin-removegrain-git'
)
source=(
	"https://github.com/realfinder/AVS-Stuff/raw/master/avs%202.6%20and%20up/QTGMC.avsi"
	"qtgmc.vpy"
)
sha256sums=(
	"c4e8e3f7d0e75f17ced148c6c66d651ae2c70fc97a1f0f1923877be90a4f29c5"
	"SKIP"
)

package() {
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	cp "${srcdir}/QTGMC.avsi" "${pkgdir}/usr/share/${pkgname}/"

	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/qtgmc.vpy" "${pkgdir}/usr/bin/"
}
