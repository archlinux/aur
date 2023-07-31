# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.5.10
pkgrel=1
pkgdesc="A cli tool to easily create isolated shells and containers with nix."
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://www.jetpack.io/devbox/"
_githuburl="https://github.com/jetpack-io/devbox"
license=('Apache')
optdepends=('docker' 'nix')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('351d3d36e9fd7c8f48482d37524e2c5dbcb7b2dd1dbca6234fd76a5e3ef53225')
sha256sums_armv7h=('351d3d36e9fd7c8f48482d37524e2c5dbcb7b2dd1dbca6234fd76a5e3ef53225')
sha256sums_i686=('b5973e2f092ee780a9b7762233e9379c4b37494f70aa6e27d2eea6ba77b8e815')
sha256sums_x86_64=('bee7ff0eaac3fc0807566244accd703d0e4173ff946aea01deec300345dbd36b')
package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}