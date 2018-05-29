# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=mythes-el
pkgver=20180529
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
sha256sums=('ab80845f405b64c3767ab6b7184e2bb3ee2769899ac3129a6a2c126d3e7a9fc1')

package() {
  cd "$srcdir/"

  install -D -m 644 th_el_GR_v2.idx ${pkgdir}/usr/share/mythes/th_el_GR_v2.idx
  install -D -m 644 th_el_GR_v2.dat ${pkgdir}/usr/share/mythes/th_el_GR_v2.dat

  install -D -m 644 README.txt ${pkgdir}/usr/share/doc/${pkgname}/README.txt
}

# vim:set ts=2 sw=2 et:
