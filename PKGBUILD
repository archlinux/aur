# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=1.2.1
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
sha256sums_x86_64=('8b84522cfbc20735ac141c21d53b66556a67446db0b7f08eeefab78441c98568')
sha256sums_aarch64=('6bc533e748f953b02e340cbd212dda4f58ed695743a6417b80f054ebfff32530')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
