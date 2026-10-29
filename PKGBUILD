# Maintainer: Roman <roma_aw at icloud dot com>
# Contributor: Roman <roma_aw at icloud dot com>

pkgname=compassonpremise
pkgver=6.14.17
pkgrel=1
pkgdesc="A messaging app. A messenger for working with and managing teams"
arch=('x86_64')
url="https://getcompass.com"
license=('Redistributable, no modification permitted')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'polkit')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://update.getcompass.ru/electron/onpremise-compass/30/${pkgver}/compass_linux_amd64.deb")
sha512sums_x86_64=('5c851e2e0bf195f7c20a7b23734cd0d66c6a9d47f04d409849d04f6a66e34cf058a4408ca2f45e3bfdd7a1116fd7a7c83c0973b2b03083454f2d568e88a4e781')

package(){
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
