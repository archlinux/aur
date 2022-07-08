# Maintainer: Mahdy Mirzade <me@mahdi.pw>
pkgname=getip
pkgver=1.0.3
pkgrel=1
pkgdesc="Get Private/Public IP & IP's Geolocation."
arch=(any)
url="https://git.mahdi.pw/getip"
license=('MIT')
depends=('curl' 'dog' 'grep' 'jq')
makedepends=('git')
source=("$pkgname::git+git://mahdi.pw/getip.git")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
