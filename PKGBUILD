# Maintainer: Shaumyadeep Chaudhuri <shaumya at gmail.com>

pkgname=advanced-rest-client
pkgver=11.0.31
pkgrel=1
pkgdesc='A developert tool to test a HTTP request. The Advanced REST Client desktop application.'
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
source_x86_64=("https://github.com/advanced-rest-client/arc-electron/releases/download/v${pkgver}/arc-${pkgver}-amd64.deb")
sha256sums_x86_64=('ca13ec4c8446dc608cd9e33cbceb8b04f59dcfbd09cb7c373fe74deb99cefcc2')

prepare() {
	tar -xf data.tar.xz
}

package() {
	# Install
	cp -dr --no-preserve=ownership {opt,usr} "${pkgdir}"/
}

