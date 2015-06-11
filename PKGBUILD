# Maintainer: Viktor Stanchev <me aatt viktorstanchev doot com>

pkgname=pirate-get
pkgver=0.2.4
pkgrel=1
pkgdesc='A command line interface for the Pirate Bay'
arch=('any')
url='https://github.com/vikstrous/pirate-get/'
license=('AGPL')
depends=('python')
optdepends=('python-colorama: for colored output')
source=('https://github.com/vikstrous/pirate-get/archive/v'${pkgver}'.tar.gz')
sha256sums=('17f26e015e15afd280123b173678566b19879fe61fdaf53fd7676461308ad006')

package() {
  mkdir -p ${pkgdir}/usr/bin/
  cp ${pkgname}-${pkgver}/${pkgname}.py ${pkgdir}/usr/bin/${pkgname}
}

check() {
  stat ${pkgname}-${pkgver}/${pkgname}.py
}
