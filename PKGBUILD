# Maintainer: Gowtham2003 <gowtham2003g@gmail.com>
# Contributor: Gowtham2003 <gowtham2003g@gmail.com>
pkgname=hoppscotch-bin
pkgver=24.8.3
pkgrel=0
pkgdesc="Hoppscotch. Open source API development ecosystem"
arch=('x86_64')
url="https://hoppscotch.io/"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/hoppscotch/releases/releases/download/v${pkgver}-${pkgrel}/Hoppscotch_linux_x64.deb")
sha512sums_x86_64=('76860a8f6782b009931fd9e88f948aa0ab553b06d05855004746b30859294070cd6af53fb6dd83f5ccf699aebb59dae56c4c75a3661062a9e8f66eb5e5163b08')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
