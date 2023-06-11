# Maintainer: Muvment <muvment.lkayt@slmail.me>

pkgname=eastern-wisdom-cli
pkgver=1.0.0
pkgrel=1
pkgdesc='Get a random quote from the Dhammapada or the Dao De jing in your teminal, with optional color output.'
arch=('any')
url='https://github.com/muvment/eastern-wisdom-cli'
depends=('bash')
license=('MIT')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)

sha256sums=(
    '26c55b0075323f304671a6c198bb23efb5a40c04b361f3227390ad567039c2c2'
)

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/wisdom" "${pkgdir}/usr/bin/wisdom"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
