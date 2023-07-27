# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.5.8
pkgrel=1
pkgdesc="A cli tool to easily create isolated shells and containers with nix."
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://www.jetpack.io/devbox/"
_githuburl="https://github.com/jetpack-io/devbox"
license=('Apache')
optdepends=('docker' 'nix')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('dd1c21f919b991a4e7ccff1e89036c815d66fbd7e2055fee2b49bcbdeb996894')
sha256sums_armv7h=('dd1c21f919b991a4e7ccff1e89036c815d66fbd7e2055fee2b49bcbdeb996894')
sha256sums_i686=('c2a570fb590e9de052bfbf7a799774c9d322d09370684f46c44e9c5e40750f21')
sha256sums_x86_64=('698380efc032bd8482ac53cfc8dfe2616cced9c1175358d9538abf3cd6ea34f0')
package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}