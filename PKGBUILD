# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=2.0.5
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
sha256sums_x86_64=('ce856cf305e42dce65c3bc9be3f9682b64a4be160a1ddaa2746705487541ff3c')
sha256sums_aarch64=('d941905dfef23a22e769bd067569afe2ebacad0a270dde4e2be6ef4b4835178e')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
