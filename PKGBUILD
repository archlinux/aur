# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=3.5.359539.0224
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('x86_64')
license=('custom')
url="https://zoom.us/"
depends=('fontconfig' 'glib2' 'libpulse' 'libsm' 'libx11' 'libxcb' 'libxcomposite' 'libxfixes' 'libxi'
	'libxrandr' 'libxrender' 'libxshmfence' 'libxslt' 'mesa' 'nss' 'pulseaudio-alsa' 'xcb-util-image' 'xcb-util-keysyms')
options=(!strip)
source=("${pkgname}-${pkgver}_orig_x86_64.pkg.tar.xz"::"https://zoom.us/client/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('a8a7a5b25c98d83844f640980b66c3fd821b54cb85e8a9a2a680046a39223fbc3af7c3c81f0f5dccfa7609daf246ead4edad9f46516905196a8398a63e8d1c7b')

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
