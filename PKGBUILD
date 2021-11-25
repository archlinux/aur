# Maintainer: Holger Schramm <dev@strace.it>
pkgname=mingo-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="A MongoDB GUI based on electron from developers for developers"
arch=('i686' 'x86_64')
url="https://github.com/mingo-app/mingo#readme"
license=('custom:mingo')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/mingo-app/mingo/releases/download/v${pkgver}/mingo_${pkgver}_amd64.deb")
sha512sums_x86_64=('25c27ee0dfa6d9155ab1f5c5a90467565d244ff6513e0d3b21acbe9b299917a40f1b542239f4a21b51602c999986a9cf657c19d6bce7bcbc8aa2df80d372d626')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Mingo/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
