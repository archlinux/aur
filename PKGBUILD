# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=2.6.1
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64' 'aarch64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-amd64-Miru-${pkgver}.deb")
sha512sums_x86_64=('837e9410007a5295df1f93254cf45c8265ab3c8847803ff5c2808ab9afbffa9e4aa57d2dce2fb9ba9fbdd0007244c11d1bc03bbaf55d6bb880507c20c20126a8')
source_aarch64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-arm64-Miru-${pkgver}.deb")
sha512sums_aarch64=('fad1d1755ba8fb93e89d0ac7b540a758f2d82a74a0afe7e5d9fdaf486bfb140e0f527c308d0c3164766d6bf6c37ee10651a702dbfebe573715bd79321ff93805')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
