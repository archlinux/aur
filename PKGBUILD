# Maintainer: blackflame007 <https://github.com/blackflame007>
pkgname=mehshell-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="Fast, parallelized zsh prompt engine written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/blackflame007/mehshell"
license=('MIT')
depends=('zsh')
optdepends=('nerd-fonts: icon support')
provides=('mehshell')
conflicts=('mehshell')

source_x86_64=("mehshell-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/mehshell_linux_amd64.tar.gz")
source_aarch64=("mehshell-${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/mehshell_linux_arm64.tar.gz")
source=("LICENSE::https://raw.githubusercontent.com/blackflame007/mehshell/master/LICENSE")
sha256sums_x86_64=('30aa5fe731d6c484404fc665691494baf78d7af0250ee63677d57de07a0b5fb5')
sha256sums_aarch64=('1fcb8c2b3db6e01e9d1f9d2a0538761ff60585ba91642c474e4fad4d38e4a6de')
sha256sums=('SKIP')

package() {
    install -Dm755 mehshell "${pkgdir}/usr/bin/mehshell"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
