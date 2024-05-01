# Maintainer: Gowtham2003 <gowtham2003g@gmail.com>
# Contributor: Gowtham2003 <gowtham2003g@gmail.com>
pkgname=hoppscotch-bin
pkgver=24.3.2
pkgrel=1
pkgdesc="Hoppscotch. Open source API development ecosystem"
arch=('x86_64')
url="https://hoppscotch.io/"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/hoppscotch/releases/releases/download/v${pkgver}-${pkgrel}/Hoppscotch_linux_x64.deb")
sha512sums_x86_64=('9ae5d2fcfbc2bb18d0a2bb8d4d2f843c2d81a56d05717d645926db6bf507970b38091345c9bf98880fe7706d4bb8f7d446404b74f9c53e98eede1cb0b3c3e5d7')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
