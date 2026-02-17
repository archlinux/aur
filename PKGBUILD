# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=0.2
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
sha256sums_x86_64=('de3936ca272cb5f61de992c2166d9e681fcdaabc3738c4354a0bca61754958e0')
sha256sums_aarch64=('8b841ad56bda2776c6016627c3ef8d55ec138b06e6814ca23b304546ee414d0f')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
