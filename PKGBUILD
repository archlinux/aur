# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=0.6.0
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
sha256sums_x86_64=('3c55576cf605832a80f0afe1b290a54923d9a943aede7cbb6ecb4f149fe9aa68')
sha256sums_aarch64=('295203f399ed699b18f31444f6b62f075a2ad4bcdd0284ab9e98b251d1e4dc4f')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
