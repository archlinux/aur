# Maintainer: Shaumyadeep Chaudhuri <shaumya at gmail.com>
# Maintainer: Luis Perez <luis.perez at protonmail.com>

pkgname=advanced-rest-client
pkgver=15.0.6
pkgrel=1
pkgdesc='A developer tool to test a HTTP request. The Advanced REST Client desktop application.'
arch=('x86_64')
url='https://advancedrestclient.com/'
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
sha256sums_x86_64=('ccbdf780b8a91da57d9b4d4d12a917d83fcd19951805e85e7a453fb0fe8a2c31')

prepare() {
	tar -xf data.tar.xz
}

package() {
	# Install
	cp -dr --no-preserve=ownership {opt,usr} "${pkgdir}"/
}

