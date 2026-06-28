# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=1.2.0
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
sha256sums_x86_64=('2a07c488058282edfc15e127d8077bf4e360cf98ea8b77eb8f396996c73bde04')
sha256sums_aarch64=('6705ee951f76ce93b76558df3488a2a9fa974c823cfd8005b7cd33b0f7525326')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
