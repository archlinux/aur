# Maintainer: Liam Doan <not.lamdn@gmail.com>

pkgname=surfshark-client
pkgver=1.6.0.2040
pkgrel=1
pkgdesc="Surfshark VPN GUI client for Linux. Encrypt your internet activity so no one can track or steal your data. Increase your privacy and avoid tracking by using a different IP address. Keep your digital freedom and security while using unprotected networks."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('alsa-lib' 'at-spi2-core' 'gjs' 'nss' 'org.freedesktop.secrets' 'wireguard-tools')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark/surfshark_1.6.0-2040_amd64.deb")
sha512sums=('3d1690c303e42645d7d45df9f089b83cfd8f931c67e3197a69b2cff00cd36a2bd4dc7ab34e4b41c902fb42bef3f2e716f9596b37708f5649bf49ecdd1d7ddbc8')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
