# Maintainer: Luis Pérez <luis.perez@protonmail.com>
_pkgname=vermin
pkgname=${_pkgname}-bin
pkgver=0.87.0
pkgrel=1
pkgdesc='The smart virtual machines manager'
arch=('x86_64')
url="https://github.com/mhewedy/vermin"
license=('Apache License 2.0')
makedepends=('go')
source=("https://github.com/mhewedy/vermin/releases/download/v0.87.0/${_pkgname}-v${pkgver}-linux.tar.gz")
sha256sums=('cd4d29c1776fc3995f31c6d35145b29a19ef2d920cdce47d3986d3dd20d7905f')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
}
