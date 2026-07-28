# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=2.0.3
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
sha256sums_x86_64=('6af1f594ec3dc2370c2bbd894b3f8db4b1281e36e7df46a7cc6d4ac4eb4302d7')
sha256sums_aarch64=('f688e046667b6cb6681522d931a203fd79c8b10193589526ad979bab1f6c29df')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
