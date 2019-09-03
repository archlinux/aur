# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=3.0.285090.0826
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('x86_64')
license=('custom')
url="https://zoom.us/"
depends=('fontconfig' 'glib2' 'libpulse' 'libsm' 'libx11' 'libxcb' 'libxcomposite' 'libxfixes' 'libxi'
	'libxrandr' 'libxrender' 'libxshmfence' 'libxslt' 'mesa' 'nss' 'pulseaudio-alsa' 'xcb-util-image' 'xcb-util-keysyms')
options=(!strip)
source=("${pkgname}-${pkgver}_orig_x86_64.pkg.tar.xz"::"https://zoom.us/client/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('a87feb2dd396622a1e987ff2bb9d9591e9e354ea211dc38cd93d15ac318f71dad28c9ecbf202b9d4ff1ccc0297ad8864357db583b769803d66b3e66126a6fc4a')

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
