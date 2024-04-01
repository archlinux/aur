# Maintainer: Liam Doan <not.lamdn@gmail.com>

pkgname=surfshark-client
pkgver=2.3.1.3267
pkgrel=1
pkgdesc="Surfshark VPN GUI client for Linux. Encrypt your internet activity so no one can track or steal your data. Increase your privacy and avoid tracking by using a different IP address. Keep your digital freedom and security while using unprotected networks."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('alsa-lib' 'at-spi2-core' 'gjs' 'nss' 'org.freedesktop.secrets' 'wireguard-tools')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark_2.3.1_amd64.deb")
sha512sums=('9ecb7b12a884eb04b0f4f6377f2acaec28c59ec1f1c09d65de917452774133325702a056617cb9a4087a8ed39b99f2413816a1fef9ababb025a6fb842681ef64')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
