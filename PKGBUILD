# Maintainer: maximalmax90 <maximalmax90@mail.ru>
pkgname=vs1clickmodinstaller
pkgver=0.1
pkgrel=1
pkgdesc="Vintage Story 1-click install handler"
arch=("any")
url="https://github.com/maximalmax90/vs1clickmodinstaller"
license=('GPL-3.0')
depends=("python-requests" "tk")
source=("https://github.com/maximalmax90/vs1clickmodinstaller/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('47ed8afdb61843e08f8bb17abffdf1fdaba2720c2cf35f9813e45edaec0c14f5')
conflicts=("vs1clickmodinstaller-native")

package() {
	install -Dm644 "${pkgname}-${pkgver}/${pkgname}".desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
