# Maintainer: Stezko <stezko@gmail.com>
pkgname=assistant-bin
pkgver=4.8
pkgrel=3
pkgdesc="Secure remote access to computers over a local network or over the Internet."
arch=('x86_64')
url="https://xn--80akicokc0aablc.xn--p1ai"
license=('custom:OOO SAFIT')
depends=('bash' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme')
options=('!strip' '!emptydirs')
install=${pkgname}.install
DLAGENTS=("https::/usr/bin/wget --no-check-certificate")
source=("${pkgname}_${pkgver}-${pkgrel}_amd64.deb::https://xn--80akicokc0aablc.xn--p1ai/скачать/Download/545")
sha512sums=('ea5624c7e9622e16ec281ec844b5ff0502b99ccb7e841be5e8996b0f45ff4b7ab35c1d72dc55e55d9cb2d26ae09aaa3b9a59c9fa51b16889d92226c5ec97002a')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "/opt/assistant/license/License.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
