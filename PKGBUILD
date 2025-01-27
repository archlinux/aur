# Maintainer: Voislav V. <voyo@thelazysre.com>
pkgname=td-tui
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple task management TUI tool"
arch=('x86_64' 'aarch64')
url="https://github.com/voioo/td"
license=('0BSD')
provides=('td')
conflicts=('td')
depends=('git')

source_x86_64=("https://github.com/voioo/td/releases/download/v${pkgver}/td_linux_amd64.tar.gz")
source_aarch64=("https://github.com/voioo/td/releases/download/v${pkgver}/td_linux_arm64.tar.gz")
sha256sums_x86_64=('c4230502ed9a6f7c7d347d0a5825b852c8c7fcbb6873e250da10cb3da5868b9e')
sha256sums_aarch64=('e4b99f7ca8575e24074d5504f231718d43fc99a1b925029fb133893e23da594a')

package() {
    install -Dm755 td "${pkgdir}/usr/bin/td"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
