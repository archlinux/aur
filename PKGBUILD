# Maintainer: Voislav V. <voyo@thelazysre.com>
pkgname=td-tui
pkgver=0.3.0
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
sha256sums_x86_64=('308ad402ed00e579bf523b8452641124bdceb6e4f804d01d721af1671c51387a')
sha256sums_aarch64=('b295b14ed95587ff40679f7484e1a3efe43c962736a1654a06883fc2841dd91b')

package() {
    install -Dm755 td "${pkgdir}/usr/bin/td"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
