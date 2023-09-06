# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.5.13
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
sha256sums_aarch64=('e94e9af03f895da7231f5ab16c4fb666067da4d25fdfa38ff38f5c1e180e51b3')
sha256sums_armv7h=('e94e9af03f895da7231f5ab16c4fb666067da4d25fdfa38ff38f5c1e180e51b3')
sha256sums_i686=('d1582a6d17bb0616dbc0ce6abb98b694795c48bf77a8ba0eeb9a6f82855050e3')
sha256sums_x86_64=('92c332122ce8c4ccd09a8e0d59dc7d0a52a749a8f43ed434db765def07cfe8eb')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}