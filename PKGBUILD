# Maintainer: Adrian Zankich <azankich@pivotal.io>
pkgname=kbld-bin
pkgdesc="kbld seamlessly incorporates image building and image pushing into your development and deployment workflows"
pkgver=0.23.0
pkgrel=1
url="https://get-kbld.io/"
arch=('x86_64')
license=('apache')
groups=('k14s-bin')
provides=('kbld')
conflicts=('kbld')
_binary=kbld-linux-amd64
source=("${_binary}-v${pkgver}::https://github.com/k14s/kbld/releases/download/v${pkgver}/${_binary}")
sha256sums=("2367d6376c2d3a5a08d6d780d9721829abbfee13d3e9301271b166e90e472d15")

package() {
  install -Dm 755 "${srcdir}/${_binary}-v${pkgver}" "${pkgdir}/usr/bin/kbld"
}
