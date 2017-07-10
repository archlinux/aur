# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=gimme
pkgver=1.2.0
pkgrel=1
pkgdesc="A shell script that knows how to install Go"
arch=('any')
license=('MIT')
url="https://github.com/travis-ci/gimme"

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ae4fd0b5fb7c53e08c3e803b0e81e03d6b1aa3bd982625df8f1e3ef79c5fe760')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/gimme"

  install -m755 "${srcdir}/gimme-${pkgver}/gimme" "${pkgdir}/usr/bin/gimme"
  install -m644 "${srcdir}/gimme-${pkgver}/LICENSE" "${pkgdir}/usr/share/gimme/LICENSE"
}
