# Maintainer: Egor Kovetskiy <e.kovetskiy@gmail.com>
pkgname=python-todo-t
pkgver=85.6422833
pkgrel=1
pkgdesc="Command-line todo list manager"
url="https://github.com/kovetskiy/t"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('python')

source=("git://github.com/kovetskiy/t.git")
md5sums=('SKIP')
backup=()

pkgver() {
    cd "t"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "t"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
