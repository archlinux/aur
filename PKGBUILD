# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_appname_=zoom
pkgname=${_appname_}2
pkgver=2.7.162522.0121
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service (version 2)"
arch=('x86_64')
license=('custom')
url="https://zoom.us/"
depends=('fontconfig' 'glib2' 'libpulse' 'libsm' 'libx11' 'libxcb' 'libxcomposite' 'libxfixes' 'libxi'
	'libxrandr' 'libxrender' 'libxshmfence' 'libxslt' 'mesa' 'nss' 'pulseaudio-alsa' 'xcb-util-image' 'xcb-util-keysyms')
provides=("${_appname_}")
conflicts=("${_appname_}")
options=(!strip)
source=("${_appname_}-${pkgver}_orig_x86_64.pkg.tar.xz"::"https://zoom.us/client/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('5b86c8ee2db67a7afce1bb398acd8ab46e63dd0bec387267e1ee70110cfdd59facef595dd5be94a06cc7b15e7251fa5d4f595cd2325c923bb3ea159ecbb07b49')

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
