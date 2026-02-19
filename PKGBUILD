# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=0.3
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
sha256sums_x86_64=('e39fa38fce381661d8b10a59131e038d0aabff29e2dd86bdba92b1ef5996de94')
sha256sums_aarch64=('86db2a8a0729da36d4be4b201b084285a8fb94b6136104fa36456ba09344553a')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
