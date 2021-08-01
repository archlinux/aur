# Maintainer: Mahdy Mirzade <me@mahdym.ir>

pkgname=gip
pkgver=1.0.2
pkgrel=3
pkgdesc="Get Private/Public IP & IP's Geolocation."
arch=(any)
url="https://github.com/mahdymirzade/gip"
license=('GPL-3.0')
depends=('bash' 'curl' 'dog' 'grep' 'jq')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MahdyMirzade/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("207167246fa45854878e4b548da1acd7c84984f760383e701d8847811b725385")

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${path}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
