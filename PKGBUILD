# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=gimme
pkgver=1.5.3
pkgrel=1
pkgdesc="A shell script that knows how to install Go"
arch=('any')
license=('MIT')
url="https://github.com/travis-ci/gimme"

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('66b654f460efe9a697fdefda39fa73308f6e2f25393b28c7979724f28159a613')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/gimme"

  install -m755 "${srcdir}/gimme-${pkgver}/gimme" "${pkgdir}/usr/bin/gimme"
  install -m644 "${srcdir}/gimme-${pkgver}/LICENSE" "${pkgdir}/usr/share/gimme/LICENSE"
}
