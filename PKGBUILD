# Maintainer: Roman <roma_aw at icloud dot com>
# Contributor: Roman <roma_aw at icloud dot com>

pkgname=compassonpremise
pkgver=6.11.15
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
sha512sums_x86_64=('1e7a8f89d0c33f356a082fd0170ad7a69e39f8cc6894162df1cd8cf12b0477e325a2755ca4818b391d37a345715bcde8d668e369293e798490304092512ef76f')

package(){
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
