# Maintainer: Henrik Hodne <henrik@hodne.io>

pkgname=otf-fira-code
pkgver=0.5
pkgrel=1
pkgdesc="monospaced font with programming ligatures"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=(https://github.com/tonsky/FiraCode/archive/${pkgver}.tar.gz)
md5sums=('11e49eee5e0540828a8ba8298c404258')
install=${pkgname}.install
license=("custom: SIL Open Font License")

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/FiraCode-${pkgver}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
	install -D -m644 "${srcdir}/FiraCode-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
