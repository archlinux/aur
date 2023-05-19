# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="A cli tool to easily create isolated shells and containers with nix."
arch=('x86_64')
url="https://www.jetpack.io/devbox/"
_githuburl="https://github.com/jetpack-io/devbox"
license=('Apache')
depends=()
optdepends=('docker' 'nix')
provides=()
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('754a5550005b47110dc9b28b8fda6de2b13dfb82ae580ecb3cd86e6f6f5c27ca')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}
