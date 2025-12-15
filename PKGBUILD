# Maintainer: Roman <roma_aw at icloud dot com>
# Contributor: Roman <roma_aw at icloud dot com>

pkgname=compassonpremise
pkgver=6.9.5
pkgrel=1
pkgdesc="A messaging app. A messenger for working with and managing teams"
arch=('x86_64')
url="https://getcompass.com"
license=('Redistributable, no modification permitted')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://update.getcompass.ru/electron/onpremise-compass/30/${pkgver}/compass_linux_amd64.deb")
sha512sums_x86_64=('0473360eee770abedd2437f58dcebd6ce51b129e8f4313685551736db094106aa233f6fe75b6b25aadb8a1c7c110407cf2290a38e040facfc66ccce3d9f0c245')

package(){
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
