# Maintainer: Timothy Gelter <timothy dot gelter plus aur at gmail dot com>
pkgname=cryptr-bin
pkgver=0.6.0
pkgrel=2
pkgdesc="A GUI for Vault"
arch=('x86_64')
url="https://github.com/adobe/cryptr#readme"
license=('Apache')
depends=('gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'libxss')
options=('!strip' '!emptydirs')
install=cryptr.install
source=("https://github.com/adobe/cryptr/releases/download/v${pkgver}/cryptr_${pkgver}_amd64.deb")
sha256sums=('4072fcff61690f94af36fd872f186aae8d8c1016c056698f3bf04e06a226ccf2')
package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/Cryptr/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
