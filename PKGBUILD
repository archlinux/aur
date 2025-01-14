# Maintainer: Luis Pérez <luis.perez@protonmail.com>
_pkgname=vermin
pkgname=${_pkgname}-bin
pkgver=0.130.0
pkgrel=1
pkgdesc='The smart virtual machines manager'
arch=('x86_64')
url="https://github.com/mhewedy/vermin"
license=('Apache')
makedepends=('go')
source=("https://github.com/mhewedy/vermin/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux.tar.gz")
sha256sums=('40be4de71d00debd445a9ec1345eef31f255e508c187855daa96da81a4bc1295')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
}
