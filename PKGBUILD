# Maintainer: Shaumyadeep Chaudhuri <shaumya at gmail.com>
# Maintainer: Luis Perez <luis.perez at protonmail.com>

pkgname=advanced-rest-client-bin
pkgver=17.0.9
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
sha256sums_x86_64=('0a7df49097829306953e3073e974bc0af5626673d29ff773a263175759d37bef')

prepare() {
	tar -xf data.tar.xz
}

package() {
	# Install
	cp -dr --no-preserve=ownership {opt,usr} "${pkgdir}"/
}

