# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=2.0.106600.0904
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
sha512sums=('994d12b2ca424ab1fee2f6ac83e33effe9b11180aea4e1ff425c5e147b1f452abc53de7c59280807b77ed99590a1923c974b6602560c96ccfd72460aab5133b4')

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
