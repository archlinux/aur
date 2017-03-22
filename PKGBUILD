# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=2.0.87130.0317
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
sha512sums=('6eb02c748faa46b93e7331299be42a59c0fecbef5f512a3ba1f654f9d315002cd61fcbf148a8d79b5cd9ccf9dd0b11842bcdb6654bf86c9a4c25e34cd0ca40ad')

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
