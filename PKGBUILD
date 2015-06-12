# Maintainer: Simon Legner<Simon.Legner@gmail.com>

# Package name due to conflict with https://aur.archlinux.org/packages.php?ID=12473
pkgname=sl-ls
pkgver=1.1.3
pkgrel=1
pkgdesc="A /bin/ls replacement, aiming for a more helpful way of displaying files (by grouping, highlighting, filtering, annotating, etc.)"
arch=(any)
url="http://practicalthought.com/sl/"
license=('GPL3')
depends=('tcl')
source=(http://practicalthought.com/sl/sl)

package() {
  install -Dm 755 $srcdir/sl $pkgdir/usr/bin/sl
}

# vim:set ts=2 sw=2 et:
md5sums=('ed4c22a531e957c95df5f41206d6ed2f')
