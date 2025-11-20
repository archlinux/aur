# Maintainer: Roman <roma_aw at icloud dot com>
# Contributor: Roman <roma_aw at icloud dot com>

pkgname=compassonpremise
pkgver=6.8.11
pkgrel=1
pkgdesc="A messaging app. A messenger for working with and managing teams"
arch=('x86_64')
url="https://getcompass.com"
license=('CC0-1.0')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://update.getcompass.ru/electron/onpremise-compass/30/${pkgver}/compass_linux_amd64.deb")
sha512sums_x86_64=('c137beb32a4bc57241a0aedddf82575fce2665a317a53cb3a278b0785f677f136214c718a28cbc44e62a99fd36bacfcf27046a87f0c9fc294a44065a14ae1b52')

package(){
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
