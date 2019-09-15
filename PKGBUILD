# Maintainer Manuel Palenzuela <sadshinobi@protonmail.com>

author=sjl
pkgname=python-todo-t
pkgver=0
pkgrel=1
pkgdesc="Command-line todo list manager"
url="https://github.com/sjl/t.git"
makedepends=('git' 'python')
license=('GPL')
arch=('any')
source=("git+https://github.com/sjl/t.git")
provides=('python-todo-t')

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "t"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "t"
    python setup.py install --root=$pkgdir
}

