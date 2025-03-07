# Maintainer: Gowtham2003 <gowtham2003g@gmail.com>
# Contributor: Gowtham2003 <gowtham2003g@gmail.com>
pkgname=hoppscotch-bin
pkgver=25.2.1
pkgrel=0
pkgdesc="Hoppscotch. Open source API development ecosystem"
arch=('x86_64')
url="https://hoppscotch.io/"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl-1.1' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/hoppscotch/releases/releases/download/v${pkgver}-${pkgrel}/Hoppscotch_linux_x64.deb")
sha512sums_x86_64=('eea30c0f446bf23ac98ea9af2737d2261c017a01aea4400b71bab28b3cb549de92d99ce5b374f2feebc03dd906aeea6d3f8b2d1087f0156ff0d191770e77833e')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
