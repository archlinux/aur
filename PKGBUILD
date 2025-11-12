# Maintainer: Roman <roma_aw at icloud dot com>
# Contributor: Roman <roma_aw at icloud dot com>

pkgname=compassonpremise
pkgver=6.8.4
pkgrel=2
pkgdesc="A messaging app. A messenger for working with and managing teams"
arch=('x86_64')
url="https://getcompass.com"
license=('CC0-1.0')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://update.getcompass.ru/electron/onpremise-compass/22/${pkgver}/compass_linux_amd64.deb")
sha512sums_x86_64=('35f3b5f13d965c9c58a652b6b0c3510031fc58fb96b6f0eb8b829eb8dd0abf27c50ac948ef21f27ac8338d53c5a2ca359219f456b30a8e4a6183f2517a20d633')

package(){
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
