# Maintainer: Henrik Hodne <henrik@hodne.io>

pkgname=otf-fira-code
pkgver=1.102
pkgrel=1
pkgdesc="monospaced font with programming ligatures"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=(https://github.com/tonsky/FiraCode/archive/${pkgver}.tar.gz)
sha256sums=('1f131945c5a71572a6442a252e457711425b660edb26a950efdc24dee1e7f94a')
install=${pkgname}.install
license=("custom: SIL Open Font License")

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/FiraCode-${pkgver}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
	install -D -m644 "${srcdir}/FiraCode-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
