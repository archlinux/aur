# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=0.7.0
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
sha256sums_x86_64=('86f1d01415f604abf1f5b9a0397ef69b81316d672a7e2385204affa9942bbe88')
sha256sums_aarch64=('92129798be4e4dde5f9d029fa65aa4f51a94d974f7974d11b7306e4a4b947175')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
