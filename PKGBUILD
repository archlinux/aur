# Maintainer: Voislav V. <voyo@thelazysre.com>
pkgname=td-tui
pkgver=0.2.56
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
sha256sums_x86_64=('eda878410adcd8aa9cda6179f877b3c9adfc606fb2adb15bb430176d3c7dcb0a')
sha256sums_aarch64=('6b6cb00d4841fa4a6103ce6b25b911520dde45c95223b2a4996e6317abaa0cc1')

package() {
    install -Dm755 td "${pkgdir}/usr/bin/td"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
