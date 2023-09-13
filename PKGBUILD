# Maintainer: maximalmax90 <maximalmax90@mail.ru>
pkgname=vs1clickmodinstaller
pkgver=0.2
pkgrel=1
pkgdesc="Vintage Story 1-click install handler"
arch=("any")
url="https://github.com/maximalmax90/vs1clickmodinstaller"
license=('GPL-3.0')
depends=("python-requests" "tk")
source=("https://github.com/maximalmax90/vs1clickmodinstaller/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4787dbb58ed59cf0217ef0e02454bf85ced83436ade7110a60594f3ee1460d2b')
conflicts=("vs1clickmodinstaller-native")

package() {
	install -Dm644 "${pkgname}-${pkgver}/${pkgname}".desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
