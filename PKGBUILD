# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
groups=('')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v2.3.0/linux-Miru-2.3.0.deb")
sha512sums_x86_64=('7899d6fbd395452d1c6a8b662ec263e83ad19f1f81d4bbbedff605268314b81e252d029ce10023807a118fd770934181c074d83cd608e88342d9d7b08ac37833')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
