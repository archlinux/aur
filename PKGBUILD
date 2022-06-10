# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=2.6.0
pkgrel=2
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64' 'aarch64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-amd64-Miru-${pkgver}.deb")
sha512sums_x86_64=('7d164dff0500c229a7a516dd94eafe36642d5560cc55ead936dca17377b34e5e12aa3e214c4e85c4fc65a4c240f58f142333bb025cf4b2bf555b8eafec931599')
source_aarch64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-arm64-Miru-${pkgver}.deb")
sha512sums_aarch64=('4918095b3546883b726d1e42e20bf280e272f6e0b419accb0b55b19e23a836b9d4fdac8fb7fe1db7f23d11146be8ca5310986ed3515f4487aee0fedbca9ad247')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
