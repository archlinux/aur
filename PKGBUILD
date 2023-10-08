# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.5.14
pkgrel=1
pkgdesc="A cli tool to easily create isolated shells and containers with nix."
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://www.jetpack.io/devbox/"
_githuburl="https://github.com/jetpack-io/devbox"
license=('Apache')
optdepends=('docker' 'nix')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('d4a2c9d24148d52c83c6535fca7e35745be5851e8850ef5589d77317f77a3ef3')
sha256sums_armv7h=('d4a2c9d24148d52c83c6535fca7e35745be5851e8850ef5589d77317f77a3ef3')
sha256sums_i686=('5d3bd21b4dd6ed1f04f7e14c3a918c405f716b93e0479febc373559bc2031fdf')
sha256sums_x86_64=('410e5d9e0cf770c22308d286d62d965b2e2427d189456558aee7366ea728cc4e')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}