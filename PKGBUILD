# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=gimme
pkgver=1.5.4
pkgrel=1
pkgdesc="A shell script that knows how to install Go"
arch=('any')
license=('MIT')
url="https://github.com/travis-ci/gimme"

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('71036f892b3cae08f29be6fd4c69fb20d9b003ec80a24221d73e995e12ab0fe0')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/gimme"

  install -m755 "${srcdir}/gimme-${pkgver}/gimme" "${pkgdir}/usr/bin/gimme"
  install -m644 "${srcdir}/gimme-${pkgver}/LICENSE" "${pkgdir}/usr/share/gimme/LICENSE"
}
