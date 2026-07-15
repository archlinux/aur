# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=3.0.0
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('66aba9f8f4225cf367ed7fe0691713b78bcfb859bfd9ce585c5ab20cdd496067946688a7dae12b2d0441a5c6fb2b7177709d499f574b4fc26e3fe99746811223')

package() {
  cd "${srcdir}/${rpkgname}-${pkgver}" || exit

  # install binary
  install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}
