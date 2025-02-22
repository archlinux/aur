# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname="mythes-el"
pkgver="20250222"
pkgrel="3"
epoch="1"
pkgdesc="Greek thesaurus"
arch=("any")
url="http://www.openthesaurus.gr/"
license=("LGPL-2.1-or-later")
makedepends=("coreutils")
optdepends=("libmythes: offers thesaurus library functions")
install="symlinks.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plp13/mythes-el/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("1344a1e2899d2742cf3018b49d4bb054069c99b2a41a2648909c29cf8bf53019")

package() {
  cd "${pkgname}-${pkgver}"
  install -D -m 644 "th_el_GR_v2.idx" "${pkgdir}/usr/share/mythes/th_el_GR_v2.idx"
  install -D -m 644 "th_el_GR_v2.dat" "${pkgdir}/usr/share/mythes/th_el_GR_v2.dat"
  install -D -m 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
