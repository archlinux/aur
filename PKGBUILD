# Maintainer: Viktor Stanchev <me aatt viktorstanchev doot com>

pkgname=pirate-get
pkgver=0.2.8
pkgrel=1
pkgdesc='A command line interface for the Pirate Bay'
arch=('any')
url='https://github.com/vikstrous/pirate-get/'
license=('AGPL')
depends=('python')
optdepends=('python-colorama: for colored output')
source=('https://github.com/vikstrous/pirate-get/archive/v'${pkgver}'.tar.gz')
sha256sums=('db3c9e86157c3a4f83cf7a974587c93320b6d091b3310f57b9f3921253c10ba5')

package() {
  mkdir -p ${pkgdir}/usr/bin/
  cp ${pkgname}-${pkgver}/${pkgname}.py ${pkgdir}/usr/bin/${pkgname}
}

check() {
  stat ${pkgname}-${pkgver}/${pkgname}.py
}
