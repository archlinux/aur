# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=5.0.399860.0429
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('x86_64')
license=('custom')
url="https://zoom.us/"
depends=('fontconfig' 'glib2' 'libpulse' 'libsm' 'ttf-font' 'libx11' 'libxcb' 'libxcomposite' 'libxfixes' 'libxi' 'libxcursor'
	'libxkbcommon-x11' 'libxrandr' 'libxrender' 'libxshmfence' 'libxslt' 'mesa' 'nss' 'pulseaudio-alsa' 'xcb-util-image' 'xcb-util-keysyms')
optdepends=('qt5-webengine: SSO login support'
			'picom: extra compositor needed by some window managers for screen sharing'
			'xcompmgr: extra compositor needed by some window managers for screen sharing')
options=(!strip)
source=("${pkgname}-${pkgver}_orig_x86_64.pkg.tar.xz"::"https://zoom.us/client/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('985d0ff7ff4aad9d75f1bd56318c77065c25b9572d4e05f74aa5916bc83c85210ab09bc4c3b58e0350d48aefd2db40079e03da1544ff2e640d2625e4aee43a34')

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
