# Maintainer: Shaumyadeep Chaudhuri <shaumya at gmail.com>

pkgname=advanced-rest-client
pkgver=15.0.5
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
sha256sums_x86_64=('54c1db109362ed0ce4e5382a1eff912f0b23c8157e04fba6a4c9815d8c69cb72')

prepare() {
	tar -xf data.tar.xz
}

package() {
	# Install
	cp -dr --no-preserve=ownership {opt,usr} "${pkgdir}"/
}

