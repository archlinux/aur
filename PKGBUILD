# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname="mythes-el"
pkgver="20180529"
pkgrel="2"
epoch="1"
pkgdesc="Greek thesaurus"
arch=("any")
url="http://www.openthesaurus.gr/"
license=("AGPL")
makedepends=("coreutils")
optdepends=("libmythes: offers thesaurus library functions")
install="symlinks.install"
source=("http://www.miliaris.eu/downloads/Greek-Thesaurus.oxt")
sha256sums=("ab80845f405b64c3767ab6b7184e2bb3ee2769899ac3129a6a2c126d3e7a9fc1")

package() {
  cd "${srcdir}"
  install -D -m 644 "th_el_GR_v2.idx" "${pkgdir}/usr/share/mythes/th_el_GR_v2.idx"
  install -D -m 644 "th_el_GR_v2.dat" "${pkgdir}/usr/share/mythes/th_el_GR_v2.dat"
  install -D -m 644 "README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
}
