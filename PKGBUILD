# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.4.9
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
sha256sums=('a06fb1a2b729e9ad378f7d2ef4636b7c66fcb17baacac565b963c6595b06501c')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}
