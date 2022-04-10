# Maintainer: Holger Schramm <dev@strace.it>
pkgname=mingo-bin
pkgver=1.7.2
pkgrel=1
pkgdesc="A MongoDB GUI based on electron from developers for developers"
arch=('i686' 'x86_64')
url="https://github.com/mingo-app/mingo#readme"
license=('custom:mingo')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/mingo-app/mingo/releases/download/v${pkgver}/mingo_${pkgver}_amd64.deb")
sha512sums_x86_64=('fbdb0056a91ce0f5dc08af29596fb5207dc8abf7bb1053a7fa9339b6af88f45fddf5c23064652220563982ea8fcbd9363826927f95660c4131fab93945a9e1e8')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Mingo/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
