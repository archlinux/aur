# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=mythes-el
pkgver=20150922
pkgrel=1
epoch=
pkgdesc="Greek thesaurus"
arch=('any')
url="http://www.openthesaurus.gr/"
license=('AGPL')
groups=()
depends=()
makedepends=('coreutils')
checkdepends=()
optdepends=('libmythes: offers thesaurus library functions')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='symlinks.install'
changelog=
source=('http://www.miliaris.eu/downloads/Greek-Thesaurus.oxt')
noextract=()
sha256sums=('5b643d93305950cdf81d219b18040829fcddd4117aecba1e6913e76d5420e3dc')

package() {
  cd "$srcdir/"

  install -D -m 644 th_el_GR_v2.idx ${pkgdir}/usr/share/mythes/th_el_GR_v2.idx
  install -D -m 644 th_el_GR_v2.dat ${pkgdir}/usr/share/mythes/th_el_GR_v2.dat

  install -D -m 644 README.txt ${pkgdir}/usr/share/doc/${pkgname}/README.txt
}

# vim:set ts=2 sw=2 et:
