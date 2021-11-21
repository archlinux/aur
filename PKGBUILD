# Maintainer: Gabriel M. Dutra <0xdutra@gmail.com>

pkgname="terraform-visual"
_pkgname="cli"
pkgrel=1
pkgver=0.2.1
pkgdesc="Terraform Visual is an interactive way of visualizing your Terraform plan"
arch=('any')
url="https://hieven.github.io/terraform-visual"
license=('MIT')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tgz")
source=("https://registry.npmjs.org/@${pkgname}/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
sha256sums=('5ddb567772f2bf6efa5c0d0520074f489c2a4ec922f31c08d9e98b2b2cc85d6d')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
}
