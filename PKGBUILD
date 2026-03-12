# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=0.5.2
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
sha256sums_x86_64=('70c41280c63b2bfd1896777df6f3876d5960e597ae7d581fa8698636133784ba')
sha256sums_aarch64=('bc8757b561a933b641572ece5fc2781e362ad37899128c0599fee94fbdd69eee')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
