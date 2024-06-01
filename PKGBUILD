# Maintainer: Gowtham2003 <gowtham2003g@gmail.com>
# Contributor: Gowtham2003 <gowtham2003g@gmail.com>
pkgname=hoppscotch-bin
pkgver=24.3.3
pkgrel=1
pkgdesc="Hoppscotch. Open source API development ecosystem"
arch=('x86_64')
url="https://hoppscotch.io/"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/hoppscotch/releases/releases/download/v${pkgver}-${pkgrel}/Hoppscotch_linux_x64.deb")
sha512sums_x86_64=('47a1be973ca49bbbe9503077760f1d4d7ecbcc7a9a584691995f57814231e80ec1d54637b59954fc16f810de239872f870031d283eab2949ade4a69896b95e49')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
