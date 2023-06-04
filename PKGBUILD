# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.5.4
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
sha256sums=('1755829e81232aa88d77c97d566bcca7b15b7ce99c9e8201dc714371056efcc2')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}