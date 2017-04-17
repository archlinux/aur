# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=2.0.89826.0417
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('x86_64')
license=('custom')
url="https://zoom.us/"
depends=('glib2' 'gstreamer' 'libxcb' 'xcb-util-image' 'fontconfig' 'mesa' 'libxi' 'libsm' 'libxrender'
	'libpulse' 'libxcomposite' 'libxslt' 'sqlite' 'xcb-util-keysyms' 'qt5-webengine' 'qt5-svg'
	'pulseaudio-alsa' 'libx11' 'nss' 'libxshmfence' 'libxfixes' 'libxrender')
options=(!strip)
source=("${pkgname}-${pkgver}_orig_x86_64.pkg.tar.xz"::"https://zoom.us/client/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('df28765541f1588633ad8520bf0370b14f7bea649f64a7da473778cee98b76d79074912386bf483878ec1342d9790a728496e22004760ef6956f7457222ec029')

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
