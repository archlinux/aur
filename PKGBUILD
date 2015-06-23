# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributer: James Pearson <james.m.pearson+arch (at) gmail (dot) com>
pkgname=fortune-mod-dune-the-butlerian-jihad
pkgver=2
pkgrel=1
pkgdesc="A fortune file constructed from the quotes at the start of every chapter in Dune: The Butlerian Jihad."
arch=('any')
url="http://github.com/xiongchiamiov/fortune-mod-dune-the-butlerian-jihad"
license=('custom:WTFPL')
depends=('fortune-mod')
groups=('fortune-mods')
source=('http://github.com/xiongchiamiov/fortune-mod-dune-the-butlerian-jihad/tarball/master')
md5sums=('18e6b8b0973bf69987b0438815a4b761')

package() {
  cd $startdir/src/xiongchiamiov-fortune-mod-dune-the-butlerian-jihad-19cd430

  strfile dune-the-butlerian-jihad dune-the-butlerian-jihad.dat

  install -D -m644 dune-the-butlerian-jihad $startdir/pkg/usr/share/fortune/dune-the-butlerian-jihad
  install -D -m644 dune-the-butlerian-jihad.dat $startdir/pkg/usr/share/fortune/dune-the-butlerian-jihad.dat
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
# vim: set ft=sh ts=2 et:

