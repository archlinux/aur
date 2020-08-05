# Maintainer: Shaumyadeep Chaudhuri <shaumya at gmail.com>
# Maintainer: Luis Perez <luis.perez at protonmail.com>

pkgname=advanced-rest-client
pkgver=15.0.7
pkgrel=1
pkgdesc='A developer tool to test a HTTP request. The Advanced REST Client desktop application.'
arch=('x86_64')
url='https://github.com/advanced-rest-client/arc-electron'
license=('Apache')
options=('!strip')
depends=(
	'gconf'
	'libnotify'
	'libappindicator-gtk3'
	'libxtst'
	'nss'
	'libxss')
install=advanced-rest-client.install
source_x86_64=("https://github.com/advanced-rest-client/arc-electron/releases/download/v${pkgver}/arc-linux-${pkgver}-amd64.deb")
sha256sums_x86_64=('4b72bf402fb91795331472bb6ee5cb1e6cb5cf1c9e0dbf6d7c9ab17b20ab27f3')

prepare() {
	tar -xf data.tar.xz
}

package() {
	# Install
	cp -dr --no-preserve=ownership {opt,usr} "${pkgdir}"/
}

