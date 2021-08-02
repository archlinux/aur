# Maintainer: Amin Vakil <info AT aminvakil DOT com>
pkgname=docker-bench-security
pkgver=1.3.5
pkgrel=1
pkgdesc="Check common best-practices around deploying Docker container"
arch=('any')
url="https://github.com/docker/docker-bench-security"
license=('Apache')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
depends=(docker)
sha256sums=(''70b7496440acbee7c80700b048a6fe1272467e2aeec3a6b6b2b46329d9fdc370)

package() {
#    install -dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${pkgname}-${pkgver}/"* "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
