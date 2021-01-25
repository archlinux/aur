# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgname=deskreen
pkgver=1.0.0
pkgrel=1
pkgdesc="Deskreen makes any device a second screen for your computer"
arch=('i686' 'x86_64')
url="https://github.com/pavlobu/deskreen#readme"
license=('AGPL3')
groups=('')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'discord' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'teamviewer' 'util-linux-libs' 'zotero')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_i686=(""https://github.com/pavlobu/deskreen/releases/download/v1.0.0/deskreen_1.0.0_amd64.deb"")
source_x86_64=(""https://github.com/pavlobu/deskreen/releases/download/v1.0.0/deskreen_1.0.0_amd64.deb"")
sha512sums_i686=('PUT_SHA512SUM_OF_i386_DEB_PACKAGE_HERE')
sha512sums_x86_64=('d1972075e199720535817f0d54d4be4205c11bc74c6948a02f2e3b26aa7cc00090b8a22d94544f67f4efb56e2ddc3c1631aa5fe8b133488cd9c47a13da93fbfc')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "/opt/Deskreen/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
