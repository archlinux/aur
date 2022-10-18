# Maintainer: Alif Rachmawadi <dev@subosito.com>

pkgname=gimme
pkgver=1.6.0
pkgrel=1
pkgdesc="A shell script that knows how to install Go"
arch=('any')
license=('MIT')
url="https://github.com/urfave/gimme"

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('437e6daf4297755b25396720f0a3a613dbada7988c89c7184c6e259674bd7555')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/gimme"

  install -m755 "${srcdir}/gimme-${pkgver}/gimme" "${pkgdir}/usr/bin/gimme"
  install -m644 "${srcdir}/gimme-${pkgver}/LICENSE" "${pkgdir}/usr/share/gimme/LICENSE"
}
