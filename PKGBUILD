# Maintainer Manuel Palenzuela <sadshinobi@protonmail.com>

author=sjl
pkgname=python-todo-t
pkgver=0
pkgrel=1
pkgdesc="Command-line todo list manager"
url="https://github.com/sjl/t"
makedepends=('git' 'python')
license=('GPL')
arch=('any')
source=("git://github.com/sjl/t")
provides=('python-todo-t')

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "t"
  
  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
