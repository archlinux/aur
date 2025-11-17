# Maintainer: Roman <roma_aw at icloud dot com>
# Contributor: Roman <roma_aw at icloud dot com>

pkgname=compassonpremise
pkgver=6.8.6
pkgrel=1
pkgdesc="A messaging app. A messenger for working with and managing teams"
arch=('x86_64')
url="https://getcompass.com"
license=('CC0-1.0')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://update.getcompass.ru/electron/onpremise-compass/22/${pkgver}/compass_linux_amd64.deb")
sha512sums_x86_64=('76b9bb3fd27a648cd3e0e66dc0b809c0872a04de2d523917c4456035bef4727505b4617661e9d5c6a60c355a31d68ad325d87498aa32cbbf5c1ef1633af984e8')

package(){
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
