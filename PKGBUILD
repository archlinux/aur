# Maintainer: blackflame007 <https://github.com/blackflame007>
pkgname=mehshell-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Fast, parallelized zsh prompt engine written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/blackflame007/mehshell"
license=('MIT')
depends=('zsh')
optdepends=('nerd-fonts: icon support')
provides=('mehshell')
conflicts=('mehshell')

source_x86_64=("${url}/releases/download/v${pkgver}/mehshell_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/mehshell_linux_arm64.tar.gz")
source=("LICENSE::https://raw.githubusercontent.com/blackflame007/mehshell/master/LICENSE")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums=('SKIP')

package() {
    install -Dm755 mehshell "${pkgdir}/usr/bin/mehshell"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
