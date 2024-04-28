# Maintainer: Gowtham2003 <gowtham2003g@gmail.com>
# Contributor: Gowtham2003 <gowtham2003g@gmail.com>
pkgname=hoppscotch-bin
pkgver=24.3.1
pkgrel=2
pkgdesc="Hoppscotch. Open source API development ecosystem"
arch=('x86_64')
url="https://hoppscotch.io/"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/hoppscotch/releases/releases/download/v${pkgver}-${pkgrel}/Hoppscotch_linux_x64.deb")
sha512sums_x86_64=('299b74fb022dd926ae2c998a7e4b2790ce7de070efe87d7e3acad3a790eee75e8d5e080ef538c9cc747e8d0c295f9d251629be280c673a7fd60851ce29ad5fcf')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
