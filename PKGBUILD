# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=2.0.7
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
sha256sums_x86_64=('4fb8eea7416c10dc7c185d356874f0e93d9f27fb450c867a11400aeeb7667a5f')
sha256sums_aarch64=('a8f5b9c292d6fb9ca52c4cc12436af7466b8753608d6178b7e45d40615327af8')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
