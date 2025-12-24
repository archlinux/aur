# Maintainer: Roman <roma_aw at icloud dot com>
# Contributor: Roman <roma_aw at icloud dot com>

pkgname=compassonpremise
pkgver=6.9.9
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
sha512sums_x86_64=('25f3f8d1cdb0aba34844a1905814e251d029a85f710ea6c26908935f84c7dbab6dc4668bbfde6d94932be9634f92ecd56df7e3dd26f0e3ca16ae9e32a3479724')

package(){
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
