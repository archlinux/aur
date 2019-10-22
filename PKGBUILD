# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=3.0.306796.1020
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('x86_64')
license=('custom')
url="https://zoom.us/"
depends=('fontconfig' 'glib2' 'libpulse' 'libsm' 'libx11' 'libxcb' 'libxcomposite' 'libxfixes' 'libxi'
	'libxrandr' 'libxrender' 'libxshmfence' 'libxslt' 'mesa' 'nss' 'pulseaudio-alsa' 'xcb-util-image' 'xcb-util-keysyms')
options=(!strip)
source=("${pkgname}-${pkgver}_orig_x86_64.pkg.tar.xz"::"https://zoom.us/client/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('bb89862491aa2f0eb3b77db15b28fb7389a5e08edfc170585d2697def9167006df166ebb56dac532f29711fbf910a9f8febc65ec5d849a3ad47cfec88fb6bcb9')

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
