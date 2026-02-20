# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=0.4
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
sha256sums_x86_64=('92e153275d649a2b4b330020ce442011a2295f98f3a6038de71b916a76e34ac9')
sha256sums_aarch64=('445dc1293773d8126c4aacb01b915b6a7c1f29bba5149dfe75931a89c25af45b')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
