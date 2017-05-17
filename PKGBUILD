# Maintainer: Giovanni 'ItachiSan' Santini (giovannisantini93@yahoo.it)
# Contributor: gyo <gyo_at_archlinux_dot_fr>
pkgname=repacman
pkgver=0.98
pkgrel=3
pkgdesc="A tool for producing a pacman package from software's existing installation"
arch=('any')
url="http://archlinux.fr/repacman"
license=('GPL')
depends=('bash')
source=("$pkgname")
md5sums=('9ea3c1f0f90b92fc3450e7fc37fdb136')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/bin/
  install -m755 $pkgname $pkgdir/usr/bin/
}
