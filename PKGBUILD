# Maintainer: Holger Schramm <dev@strace.it>
pkgname=mingo-bin
pkgver=1.6.3
pkgrel=1
pkgdesc="A MongoDB GUI based on electron from developers for developers"
arch=('i686' 'x86_64')
url="https://github.com/mingo-app/mingo#readme"
license=('custom:mingo')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/mingo-app/mingo/releases/download/v${pkgver}/mingo_${pkgver}_amd64.deb")
sha512sums_x86_64=('0911a92f6b22d786d6229944aace6c50efcbf5d7a7fc49399ac5ebec9edba323bb03ebabd688be4342249dc9051c07a30737432f8c7c88fd51050f2169d4d312')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Mingo/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
