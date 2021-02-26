# Maintainer: Luis Pérez <luis.perez@protonmail.com>
_pkgname=vermin
pkgname=${_pkgname}-bin
pkgver=0.126.0
pkgrel=1
pkgdesc='The smart virtual machines manager'
arch=('x86_64')
url="https://github.com/mhewedy/vermin"
license=('Apache')
makedepends=('go')
source=("https://github.com/mhewedy/vermin/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux.tar.gz")
sha256sums=('76528d2ca4a372ef8c6e3ba626fe64ad28bd06e4995bc2623f04b3eeb337a182')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
}
