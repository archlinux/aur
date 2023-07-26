# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=4.2.8
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb")
sha512sums_x86_64=('a0f0902ac390dffe9d663d9736d6ddeb771cbc16a320ad33b23e46b4ff238a71bcaa8ca3538b80d9df0439c5d36e9c87abdc46d38bd2bb3edbbaa7e6c15e3253')

package() {

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
