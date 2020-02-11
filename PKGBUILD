# Maintainer: Timothy Gelter <timothy dot gelter plus aur at gmail dot com>
pkgname=cryptr-bin
pkgver=0.4.0
pkgrel=2
pkgdesc="A GUI for Vault"
arch=('x86_64')
url="https://github.com/adobe/cryptr#readme"
license=('Apache')
groups=('')
depends=('gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'libxss')
options=('!strip' '!emptydirs')
install=cryptr.install
source=("https://github.com/adobe/cryptr/releases/download/0.4.0/cryptr_0.4.0_amd64.deb")
md5sums=('194d791e890856869bb38c147ce34566')
package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/Cryptr/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
