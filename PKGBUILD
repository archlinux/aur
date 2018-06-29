# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=2.2.128100.0627
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
sha512sums=('1b614d89cdcb27320cb9ccbb223e08fd4554f5b96bcaae092e7192a71a518ac9a3b17f7dfd15f7cfad365dc9abfc30904d66d8f248a2c96288e36ae129f7d405')

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
