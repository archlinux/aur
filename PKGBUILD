# Maintainer: Luis Pérez <luis.perez@protonmail.com>
_pkgname=vermin
pkgname=${_pkgname}-bin
pkgver=0.124.0
pkgrel=1
pkgdesc='The smart virtual machines manager'
arch=('x86_64')
url="https://github.com/mhewedy/vermin"
license=('Apache')
makedepends=('go')
source=("https://github.com/mhewedy/vermin/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux.tar.gz")
sha256sums=('14d7d6f7be38fd59a39e85d876ee963233a2a5360a37ba2a6c1a73aa482f8541')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
}
