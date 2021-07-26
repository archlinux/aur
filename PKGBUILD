# Maintainer: Shaumyadeep Chaudhuri <shaumya at gmail.com>
# Maintainer: Luis Perez <luis.perez at protonmail.com>

pkgname=advanced-rest-client
pkgver=16.0.1
pkgrel=1
pkgdesc='A developer tool to test a HTTP request. The Advanced REST Client desktop application.'
arch=('x86_64')
url='https://github.com/advanced-rest-client/arc-electron'
license=('Apache')
options=('!strip')
depends=(
	'libnotify'
	'libappindicator-gtk3'
	'libxtst'
	'nss'
	'libxss')
install=advanced-rest-client.install
source_x86_64=("https://github.com/advanced-rest-client/arc-electron/releases/download/v${pkgver}/arc-linux-${pkgver}-amd64.deb")
sha256sums_x86_64=('e5b87a8e3fbb4dd132e654f7b6b8d136e72c7ea7078d89a9466060bb321ce84c')

prepare() {
	tar -xf data.tar.xz
}

package() {
	# Install
	cp -dr --no-preserve=ownership {opt,usr} "${pkgdir}"/
}

