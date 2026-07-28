# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Tmux Plugin Manager"
arch=('x86_64' 'aarch64')
url="https://github.com/tmuxpack/tpack"
license=('MIT')
depends=('tmux')
provides=('tpack')
conflicts=('tpack')
source_x86_64=("https://github.com/tmuxpack/tpack/releases/download/v${pkgver}/tpack_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/tmuxpack/tpack/releases/download/v${pkgver}/tpack_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9ea50cdf97aff5f75ed63f5b0a104760625d22aa2c79662d5fcf6f8a4350d418')
sha256sums_aarch64=('88b152a4d54dfe8d34eb467de2d314861814c29f622dffe5fe472bf5efde8f2f')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
