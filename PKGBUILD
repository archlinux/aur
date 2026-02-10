# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=2.9.0
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('5fc87cd1ac8bc84c55ac823b9077d3d685134a5fbafcbee5f3ec579d541a5b5b8a2fe80f5bff8e8f8fa3f8fcbe1cb68f794777f6f2250d2d54b4aaa3753fe552')

package() {
  cd "${srcdir}/${rpkgname}-${pkgver}" || exit

  # install binary
  install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}
