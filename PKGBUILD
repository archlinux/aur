# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=gimme
pkgver=1.3.0
pkgrel=1
pkgdesc="A shell script that knows how to install Go"
arch=('any')
license=('MIT')
url="https://github.com/travis-ci/gimme"

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0facfa300107b66f0cd253d62f55e55e91f4249a4a9d82d4fdcf1b2216a57b65')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/gimme"

  install -m755 "${srcdir}/gimme-${pkgver}/gimme" "${pkgdir}/usr/bin/gimme"
  install -m644 "${srcdir}/gimme-${pkgver}/LICENSE" "${pkgdir}/usr/share/gimme/LICENSE"
}
