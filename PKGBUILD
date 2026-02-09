# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=2.8.0
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('37d85794c3a1a70e7289928778e525031b8ff72e39b9050a513d66d5e6cfbd6baf5df6b4e0c43ef256529e7432d63070e864b5ce352d3e0aed911095563497c4')

package() {
  cd "${srcdir}/${rpkgname}-${pkgver}" || exit

  # install binary
  install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}
