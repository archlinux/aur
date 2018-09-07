# Maintainer: Infernio <infernio at icloud dot com>
pkgname=sssm
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple Steam Skin Manager"
arch=('any')
url="https://github.com/Infernio/sssm"
license=('MIT')
depends=('steam')
source=("${pkgname}_${pkgver}::https://github.com/Infernio/sssm/archive/${pkgver}.tar.gz")
sha256sums=('0973827df85736a4f77e32a5724d4cc4171b471f118ec3c19af0750c12067f82')

package() {
    install -D -m755 "${srcdir}/${pkgname}-${pkgver}/sssm" "${pkgdir}/usr/bin/sssm"
}
