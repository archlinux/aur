# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>

_gitname=horcrux

pkgname=horcrux
pkgrel=1
pkgver=437afe0
pkgdesc="Makes running duplicity for secure offsite backups easy"
arch=('any')
url="https://github.com/thirtythreeforty/horcrux"
license=('GPLv3')
depends=('duplicity' 'md5deep' 'bzip2')
makedepends=('git')
source=(git://github.com/thirtythreeforty/$_gitname.git)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  echo "Nothing to build."
}

package() {
  install -Dm755 $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
