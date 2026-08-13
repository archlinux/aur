# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=2.0.4
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
sha256sums_x86_64=('337713e472dcc88c26689f5f44d5274715e2ef389cc1f881fbf8137fad7d5b57')
sha256sums_aarch64=('7abe43d2923d203206bcbbec21cb11a59a174e14917f56106b877bf715dbffe3')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
