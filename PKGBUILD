# Maintainer: Habboon <support@habboon.pw>
pkgname=habboon-client-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="A desktop application for the Habboon Client."
arch=('x86_64')
url="https://www.habboon.pw"
license=('ISC')
groups=('')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://app.habboon.pw/habboon_1.0.6_amd64.deb")
sha512sums_x86_64=('311bc110990b3edef752d7e8aa349cc7572c00cada7ec3b6f90c89756ac58b670210f729a2125faa5345e96ba09dbc7bc5b82c69fe5fd43dabe18494e9ffe918')

package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/Habboon Desktop App/LICENSES.chromium.html" \
	                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
