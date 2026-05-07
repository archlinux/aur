# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=1.0.0
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
sha256sums_x86_64=('30be322c6e36a23ae654a482bbb592465a7aa670bd7b61a919cc5846ffa2de9c')
sha256sums_aarch64=('c7fec2dad1e8fac9cd1e90cbaf8ea916af9facad7cfa49fd81d6be24f61a82be')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
