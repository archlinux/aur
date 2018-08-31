# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=gimme
pkgver=1.5.1
pkgrel=1
pkgdesc="A shell script that knows how to install Go"
arch=('any')
license=('MIT')
url="https://github.com/travis-ci/gimme"
depends=('jq')

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('18a9a17fe219b11b2a656b2b62a1fa52641bed055167d9b110b3754832fb3a3a')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/gimme"

  install -m755 "${srcdir}/gimme-${pkgver}/gimme" "${pkgdir}/usr/bin/gimme"
  install -m644 "${srcdir}/gimme-${pkgver}/LICENSE" "${pkgdir}/usr/share/gimme/LICENSE"
}
