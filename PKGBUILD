# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=0.9.1
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
sha256sums_x86_64=('4c9d3d3f511da8957d0bff13ed39701a9cb0e31b2ad267358108533000f0c81e')
sha256sums_aarch64=('488a9bb1480ec7a2f1de7d2a47b6aaf3f8ebfbe6c79c4590a8c49c3f89c77efd')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
