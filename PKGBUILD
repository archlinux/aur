# Maintainer: Tomás Ralph <tomasralph2000@gmail.com>

pkgname=wollok-ts-cli
pkgver=0.3.1
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
    "wollok-ts-cli::https://github.com/uqbar-project/wollok-ts-cli/releases/download/v${pkgver}/wollok-ts-cli-linux-x64"
)
sha256sums_x86_64=(
    '05e5a34913d0abe0fa48c2ab63238d92c52fe1063f99c6d50e87f3e0ac7be6e7'
)
options=(!strip)

package() {
    install -Dm0755 "${srcdir}/wollok-ts-cli" --target-directory "${pkgdir}/usr/bin/"
    install -Dm0644 "${srcdir}/LICENSE" --target-directory "${pkgdir}/usr/share/licenses/wollok-ts-cli/"
}
