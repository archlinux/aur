# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=0.5
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
sha256sums_x86_64=('a2c3261d9a75b86ee98619d78add76ebd84feff968355841b2b40ab813aeb6b7')
sha256sums_aarch64=('daa7b801f06003badbe5f8ca0e4bbfabeee140a534165b2dcc2176341de9e70b')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
