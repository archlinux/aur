# Maintainer: Henrik Hodne <henrik@hodne.io>

pkgname=otf-fira-code
pkgver=0.6
pkgrel=1
pkgdesc="monospaced font with programming ligatures"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=(https://github.com/tonsky/FiraCode/archive/${pkgver}.tar.gz)
sha256sums=('1f19b8400277615257ba9afb8190b053b08c1f5b30c42e8617dab0d684ac259d')
install=${pkgname}.install
license=("custom: SIL Open Font License")

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/FiraCode-${pkgver}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
	install -D -m644 "${srcdir}/FiraCode-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
