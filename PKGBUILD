# Maintainer: Infernio <infernio at icloud dot com>
pkgname=sssm
pkgver=1.1.1
pkgrel=1
pkgdesc="Simple Steam Skin Manager"
arch=('any')
url="https://github.com/Infernio/sssm"
license=('MIT')
depends=('bash' 'steam')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/Infernio/sssm/archive/${pkgver}.tar.gz")
sha256sums=('245509e209c0d16ab29a60c3b921409cdcbc6a91cf6412d8d129438d4808f8fd')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "sssm" "${pkgdir}/usr/bin/sssm"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/sssm/LICENSE"
}
