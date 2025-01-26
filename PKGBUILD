# Maintainer: Voislav V. <voyo@thelazysre.com>
pkgname=td-tui
pkgver=0.2.53
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
sha256sums_x86_64=('1a4ed660ed95356a83c619ae86eede7fabfaed62d330fd5ef02c56995cc19279')
sha256sums_aarch64=('4e19d9d9a0f7c01c11a8a9489fe18fa0fb5938ae0ee1f9a205855558137c7e31')

package() {
    install -Dm755 td "${pkgdir}/usr/bin/td"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
