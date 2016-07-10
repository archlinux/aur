# Author: Mathieu Westphal <mathieu.westphal@gmail.com>

pkgname=xplorers
pkgver=1.0
pkgrel=1
pkgdesc="Xplorers Board game"
arch=('any')
url="http://games.asobrain.com/"
license=(Other)
depends=('icedtea-web')
source=(
    "${pkgname}Cities1.jnlp::file://${pkgname}Cities1.jnlp"
    "${pkgname}Basic1.jnlp::file://${pkgname}Basic1.jnlp"
    "${pkgname}Practice1.jnlp::file://${pkgname}Practice1.jnlp"
    "${pkgname}Practice2.jnlp::file://${pkgname}Practice2.jnlp"
    "${pkgname}Team1.jnlp::file://${pkgname}Team1.jnlp"
    "${pkgname}Tournament1.jnlp::file://${pkgname}Tournament1.jnlp"
    "${pkgname}Tournament2.jnlp::file://${pkgname}Tournament2.jnlp"
    "${pkgname}Tournament3.jnlp::file://${pkgname}Tournament3.jnlp"
    "${pkgname}.sh"
    )

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'e7bb46f10f60e1aa4917d60bd9c4104f')

package() {

  # Install .jnlp files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp "${srcdir}/"*".jnlp" "${pkgdir}/opt/${pkgname}"

  # install launcher script
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
