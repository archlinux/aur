# Maintainer: Polarian <polarian@polarian.dev>
# Contributor: Holger Schramm <dev@strace.it>
pkgname=mingo-bin
pkgver=1.10.1
pkgrel=1
pkgdesc="A proprietary MongoDB GUI based on electron from developers for developers"
arch=('x86_64')
url="https://mingo.io/"
license=('custom:mingo')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'pango')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/mingo-app/mingo/releases/download/v${pkgver}/mingo_${pkgver}_amd64.deb")
sha256sums=('723e702a263598a62cc15ad176d195a37496c7157fd81e820a7781ebb4ea9140')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Mingo/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
