# Maintainer: Muvment <muvment.lkayt@slmail.me>

pkgname=vapecalc-cli
pkgver=1.0.0
pkgrel=1
pkgdesc='Vape calculator for your terminal, with both weight and volume calculation.'
arch=('any')
url='https://github.com/muvment/vapecalc-cli'
depends=('bash' 'fzf')
license=('MIT')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha512sums=(
    '27ca7cc7ea273e6de4c4af068276012f8c956d64b03f2580ca3341a81c5e229d598b055af8467bb4aa464ebc0fb52e0ab28eeae3cdeab9f50dc20f751510dc74'
)

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/vapecalc" "${pkgdir}/usr/bin/vapecalc"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
