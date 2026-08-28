# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=2.0.6
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
sha256sums_x86_64=('936eb4bfaad8e301348970bf0f7afcacd57a737435c6e1cc7beda616d29230a0')
sha256sums_aarch64=('cb61dce698ce2df760cf6c04871fce0ba8785a24a462fb19c681b650b3c352a7')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
