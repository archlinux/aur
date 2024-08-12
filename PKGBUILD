# Maintainer: Liam Doan <not.lamdn@gmail.com>

pkgname=surfshark-client
pkgver=3.0.4.4486
pkgrel=1
pkgdesc="Surfshark VPN GUI client for Linux. Encrypt your internet activity so no one can track or steal your data. Increase your privacy and avoid tracking by using a different IP address. Keep your digital freedom and security while using unprotected networks."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('alsa-lib' 'at-spi2-core' 'gjs' 'nss' 'org.freedesktop.secrets' 'wireguard-tools')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark_3.0.4_amd64.deb")
sha512sums=('9b52c22940003ced682cfc1d84d24fdff054dcc1e5554024c7d4f8c72e6eec76bc153203751038f56231c2c1e7dcf410d42415f0cc5afb769b47297837441d5d')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
