# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=3.1.0
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('25aad675105aa6cd63a4ba0793f9fa814e972f057a914dc86b0040956069dc7eeb8b9d197262b55dd8f255041620738257060c8e81b764b17e8c057122478390')

package() {
  cd "${srcdir}/${rpkgname}-${pkgver}" || exit

  # install binary
  install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}
