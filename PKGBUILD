# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=2.7.0
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('0ac5996f1a22ea24229465cc8950ca8a05f8c52f65bada613cb57059158f67b6e7c958d21af2435f3f4f17ab58a41374ff3c824abcea751ea2a6970fd562996a')

package() {
  cd "${srcdir}/${rpkgname}-${pkgver}" || exit

  # install binary
  install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}
