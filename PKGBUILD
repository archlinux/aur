# Maintainer: Infernio <infernio at icloud dot com>
pkgname=sssm
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple Steam Skin Manager"
arch=('any')
url="https://github.com/Infernio/sssm"
license=('MIT')
depends=('bash' 'steam')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/Infernio/sssm/archive/${pkgver}.tar.gz")
sha256sums=('17b3127844b40da1b0aa06f6e3208ad93a252c9b6fdbc2153406c6ce9b7227db')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "sssm" "${pkgdir}/usr/bin/sssm"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/sssm/LICENSE"
}
