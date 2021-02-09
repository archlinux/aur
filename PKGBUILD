# Maintainer: Habboon <support@habboon.pw>
pkgname=habboon-client-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="A desktop application for the Habboon Client."
arch=('x86_64')
url="https://www.habboon.pw"
license=('ISC')
groups=('')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://app.habboon.pw/habboon_1.0.5_amd64.deb")
sha512sums_x86_64=('5c18d63a8aaf88fdee0906f96ed81547483a0a61edb16d90e35d71dbc1ed7ed58dbf74e4ab57cb4edb1a210b7b7120289a2a0dfb4ff90ee7478adfbae6843f6e')

package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/Habboon Desktop App/LICENSES.chromium.html" \
	                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
