# Maintainer: Liam Doan <not.lamdn@gmail.com>

pkgname=surfshark-client
pkgver=1.5.2.1921
pkgrel=1
pkgdesc="Surfshark VPN GUI client for Linux. Encrypt your internet activity so no one can track or steal your data. Increase your privacy and avoid tracking by using a different IP address. Keep your digital freedom and security while using unprotected networks."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('alsa-lib' 'at-spi2-core' 'gjs' 'nss' 'org.freedesktop.secrets' 'wireguard-tools')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark/surfshark_1.5.2-1921_amd64.deb")
sha512sums=('cc6641b65c8d077e14903c0c6372326cd2663616f45e15d8d03e3680dff0b85196d19d6061f53c172b14c8d212feb13a10b8e3471124e0b30bb4f1712352cdd9')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
