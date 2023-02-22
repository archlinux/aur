# Maintainer: Liam Doan <not.lamdn@gmail.com>

pkgname=surfshark-client
pkgver=1.2.6
pkgrel=1
pkgdesc="Surfshark VPN GUI client for Linux. Encrypt your internet activity so no one can track or steal your data. Increase your privacy and avoid tracking by using a different IP address. Keep your digital freedom and security while using unprotected networks."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('alsa-lib' 'at-spi2-core' 'gjs' 'nss' 'org.freedesktop.secrets' 'wireguard-tools')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark/surfshark_1.2.7-1545_amd64.deb")
sha512sums=('a733550218cbe7209974870a78667ce378a10b4e76034d067c1ae1695acdce6872b0225b15cdefbc8fc488e3f1b2ad4af5f2aef977c555b670d30c4c91885eff')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
