# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=0.8.2
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
sha256sums_x86_64=('4f3e57295ab136fb5fadec4336ab1d166de8ab9b1529c05aa18c6ee8a4c0a4ed')
sha256sums_aarch64=('91e92afb7da7513574e8260b30c4d68d28545aa310eb0a5ef002f2bd39c878b5')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
