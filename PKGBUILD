# Maintainer: Tomás Ralph <tomasralph2000@gmail.com>

pkgname=wollok-ts-cli
pkgver=0.2.2
pkgrel=1
pkgdesc="Next generation Wollok command line interface written in TypeScript."
arch=(x86_64)
url="https://github.com/uqbar-project/wollok-ts-cli"
depends=(
    'glibc'
    'gcc-libs'
)
source=(
    "https://raw.githubusercontent.com/uqbar-project/wollok-ts-cli/v${pkgver}/LICENSE"
)
sha256sums=(
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)
source_x86_64=(
    "wkts::https://github.com/uqbar-project/wollok-ts-cli/releases/download/v${pkgver}/wollok-ts-cli-linux-x64"
)
sha256sums_x86_64=(
    '6e3065f19a7bcc2fdbbd58f11f3e8c960f1e68abed5ef08bcdbcbf1f1061a43f'
)
options=(!strip)

package() {
    install -Dm0755 "${srcdir}/wkts" --target-directory "${pkgdir}/usr/bin/"
    install -Dm0644 "${srcdir}/LICENSE" --target-directory "${pkgdir}/usr/share/licenses/wollok-ts-cli/"
}
