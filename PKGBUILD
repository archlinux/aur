# Maintainer: estebon <sanestebon at gmail dot com>

pkgname=papageorge-git
_gitname=papageorge
pkgver=0.1
pkgrel=1
pkgdesc="A simple client for the Free Internet Chess Server"
arch=('any')
url="http://github.com/drestebon/papageorge"
license=('GPL')
depends=('python' 'python-gobject' 'python-cairo' 'python-urwid')
source=('git://github.com/drestebon/papageorge.git')
md5sums=('SKIP')
install=$pkgname.install

package() {
  cd $srcdir/$_gitname
  python setup.py install --prefix=/usr --root=$pkgdir
}
