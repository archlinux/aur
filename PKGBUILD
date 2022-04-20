# Maintainer: Holger Schramm <dev@strace.it>
pkgname=mingo-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="A MongoDB GUI based on electron from developers for developers"
arch=('i686' 'x86_64')
url="https://github.com/mingo-app/mingo#readme"
license=('custom:mingo')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/mingo-app/mingo/releases/download/v${pkgver}/mingo_${pkgver}_amd64.deb")
sha512sums_x86_64=('523bec198427a670e84b63ae26f4e7c5385e8e69c752bb61339760826c7adb5875164c2e9f00367757ee7dd2ae108e124abe4b140250ef071ead87a009c71d4c')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Mingo/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
