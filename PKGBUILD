# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=0.1.1
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
sha256sums_x86_64=('9983b558e59348397363dc3f05e54b664046ec6610f892c073a9d81ced7a67ce')
sha256sums_aarch64=('bccc2f2f66c0705ebcbdc2e68c42dcb4d542bf95ab90c81ba7c585bbaf417951')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
