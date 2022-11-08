# Maintainer: Alif Rachmawadi <dev@subosito.com>
# Maintainer: Dan Buch <dan@meatballhat.com>

pkgname=gimme
pkgver=1.7.1
pkgrel=1
pkgdesc="A shell script that knows how to install Go"
arch=('any')
license=('MIT')
url="https://github.com/urfave/gimme"

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7df4966ccadb606c9d1ca891e9d6ef9c173be5b95414af2bdfcb02927794094d')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/gimme"

  install -m755 "${srcdir}/gimme-${pkgver}/gimme" "${pkgdir}/usr/bin/gimme"
  install -m644 "${srcdir}/gimme-${pkgver}/LICENSE" "${pkgdir}/usr/share/gimme/LICENSE"
}
