# Maintainer: Habboon <support@habboon.pw>
pkgname=habboon-client-bin
pkgver=1.0.12
pkgrel=1
pkgdesc="A desktop application for the Habboon Client."
arch=('x86_64')
url="https://www.habboon.pw"
license=('ISC')
groups=('')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://app.habboon.pw/habboon_1.0.12_amd64.deb")
sha512sums_x86_64=('d94cb4fba56c0c1a5e6041c6e7299099a65465106bcae277d188c9b1e8d1a71ee6db1dd76e5588eb15109acb9ca56e6b8f80067cf27ae9ef5f1f5af11b3283bb')

package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/Habboon Desktop App/LICENSES.chromium.html" \
	                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
