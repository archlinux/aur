# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=0.1
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
sha256sums_x86_64=('0cb48d029e275abca1c8f3ab34222853868e000a77d8edce2ed58e1bb7008b5f')
sha256sums_aarch64=('982106efbe981d904400f3b82f87acb07886ebb841fc87780455510dbc0f794c')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
