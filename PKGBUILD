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
  printf '0.r%s.%s' \
         "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "t"
    python setup.py install --root=$pkgdir
}

