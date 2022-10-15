# Maintainer: Carlo Sala <carlosalag@protonmail.com>

pkgname=surfshark-gui-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Surfshark VPN client. Keep your online activity and personal information secure. Put your privacy-conscious mind at rest and enjoy unrestricted internet."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('at-spi2-core' 'gjs' 'org.freedesktop.secrets' 'wireguard-tools')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark/surfshark_1.2.1-1175_amd64.deb")
sha512sums=('83557c9bc89b6672d79203a6c46b0b3074b866fe9c4f822c9e8c139763fd1db0519377b3310da6a873890431dc0ca509fbf7ef717f5f745b8c5bc7e9caeed640')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
