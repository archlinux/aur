# Maintainer: Holger Schramm <dev@strace.it>
pkgname=mingo-bin
pkgver=1.6.5
pkgrel=1
pkgdesc="A MongoDB GUI based on electron from developers for developers"
arch=('i686' 'x86_64')
url="https://github.com/mingo-app/mingo#readme"
license=('custom:mingo')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/mingo-app/mingo/releases/download/v${pkgver}/mingo_${pkgver}_amd64.deb")
sha512sums_x86_64=('ef6234396db7955f633d86be2744277925462faed65112467e1eb4d876af7491981ad2cd6369c423919038ef46642f765a0c579dd2b5257d00aaffdd250d1982')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Mingo/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
