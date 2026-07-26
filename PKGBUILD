# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=2.0.0
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
sha256sums_x86_64=('708262005b97ca5bc324337f45f5195581f3dde3baab20bdb69221d5b560acf7')
sha256sums_aarch64=('d14e58d5383c1fd12e406473c869285906355b0ad471c33746e0b31f68039821')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
