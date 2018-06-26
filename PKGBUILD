# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=2.2.128000.0623
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('x86_64')
license=('custom')
url="https://zoom.us/"
depends=('fontconfig' 'glib2' 'libpulse' 'libsm' 'libx11' 'libxcb' 'libxcomposite' 'libxfixes' 'libxi'
	'libxrandr' 'libxrender' 'libxshmfence' 'libxslt' 'mesa' 'nss' 'pulseaudio-alsa' 'xcb-util-image' 'xcb-util-keysyms'
	'qt5-svg' 'qt5-webengine' 'qt5-quickcontrols2')
options=(!strip)
source=("${pkgname}-${pkgver}_orig_x86_64.pkg.tar.xz"::"https://zoom.us/client/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('15fe460856e33a2e49baddef5c9dbf8c95c75bd3f01147be434d03dead909249bc0287ae58c43cedabf3199bd99d1a4bf12eebe7bf8ee4fa23ee72b2e6c2b3e5')

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
