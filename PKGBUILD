# Maintainer: Timothy Gelter <timothy dot gelter plus aur at gmail dot com>
pkgname=cryptr-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A GUI for Vault"
arch=('x86_64')
url="https://github.com/adobe/cryptr#readme"
license=('Apache')
groups=('')
depends=('gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'libxss')
options=('!strip' '!emptydirs')
install=cryptr.install
source=("https://github.com/adobe/cryptr/releases/download/v${pkgver}/cryptr_${pkgver}_amd64.deb")
sha256sums=('b4b3e685e7c0de0eba3d5141a367cfdc5d9582cfa6f0756db99287d6a161b4e7')
package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/Cryptr/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
