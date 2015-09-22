# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributer: James Pearson <james.m.pearson+arch (at) gmail (dot) com>
pkgname=fortune-mod-joel
pkgver=1
pkgrel=1
pkgdesc="fortune cookie file of Joel Spolsky quotes"
arch=('i686' 'x86_64')
url="http://www.shlomifish.org/humour/fortunes/joel-on-software"
license=('GPL')
depends=('fortune-mod')
groups=('fortune-mods')
source=('joel-on-software')
md5sums=('1da724c939ceffdc5ab2a59113df53e7')

package() {
  cd $srcdir

  strfile joel-on-software joel-on-software.dat

  install -D -m644 joel-on-software $pkgdir/usr/share/fortune/joel-on-software
  install -D -m644 joel-on-software.dat $pkgdir/usr/share/fortune/joel-on-software.dat
}
# vim: set ft=sh ts=2 et:
