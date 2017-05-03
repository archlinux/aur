# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=2.0.91373.0502
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
sha512sums=('915590dd5515db65bd34d2b4dfefb54423f1e35ad44ccc8e95d76721f0e076af6e07f98d4aea8d149dd725dc3e4d9694764235ae9864575d75ecf86a93d53ef9')

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
