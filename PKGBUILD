# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=2.0.98253.0707
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
sha512sums=('55fbdccae4f2e4dfc157b6ec3f229371dfe9ff2d8ed00c81750d7dbe85b528ef5305a04f4c0292ea32113a6c8d5ac525498f4c97fcca478f1633434d818365fc')

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
