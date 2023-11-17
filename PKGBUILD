# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="A cli tool to easily create isolated shells and containers with nix."
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://www.jetpack.io/devbox/"
_ghurl="https://github.com/jetpack-io/devbox"
license=('Apache')
optdepends=(
    'docker'
    'nix'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('fc5665e6fac1c64e76d8e8e918bbad7a0d893135300db8e8489653264057a764')
sha256sums_armv7h=('fc5665e6fac1c64e76d8e8e918bbad7a0d893135300db8e8489653264057a764')
sha256sums_i686=('4308ba8b1289e5071d6959fe7f8842826014aea73066a444475a2e3d444f32c8')
sha256sums_x86_64=('e5f5dfa412a56dc84486e9534a100b3748cd5e00b528c90509350871188203e6')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}