# Maintainer: Henrik Hodne <henrik@hodne.io>

pkgname=otf-fira-code
pkgver=1.101
pkgrel=1
pkgdesc="monospaced font with programming ligatures"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=(https://github.com/tonsky/FiraCode/archive/${pkgver}.tar.gz)
sha256sums=('a89579ce2dd24123f560fd02992031f65f85067fa9d9044edd16c36cab84e8e3')
install=${pkgname}.install
license=("custom: SIL Open Font License")

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/FiraCode-${pkgver}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
	install -D -m644 "${srcdir}/FiraCode-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
