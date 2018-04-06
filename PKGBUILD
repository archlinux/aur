# Maintainer: Shaumyadeep Chaudhuri <shaumya at gmail.com>

pkgname=advanced-rest-client
pkgver=12.1.2
pkgrel=2
pkgdesc='A developer tool to test a HTTP request. The Advanced REST Client desktop application.'
arch=('x86_64')
url='https://advancedrestclient.com/'
license=('custom')
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
sha256sums_x86_64=('f0df300d5cd3e05fc38f602cd605aac432f62babdf12732421364b25b3c27dda')

prepare() {
	tar -xf data.tar.xz
}

package() {
	# Install
	cp -dr --no-preserve=ownership {opt,usr} "${pkgdir}"/
}

