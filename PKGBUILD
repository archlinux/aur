# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=2.0.1
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
sha256sums_x86_64=('8490e606f9e8ef2057d1b465cfdac8e84a64b510cecd35a048a85a60c9ce85d0')
sha256sums_aarch64=('8def52fe23507a2f1d4245d046420bb7c963e0b2db7dcfa3d6e79de3e3251c52')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
