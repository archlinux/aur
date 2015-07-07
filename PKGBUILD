# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=spec-git
pkgver=r8.9549867
pkgrel=1
pkgdesc="Bash implementation of color spectrum for IP subneting."
arch=('any')
url="https://github.com/h3/spec"
license=('MIT')
makedepends=('git')
provides=('spec')
conflicts=('spec')
source=('git://github.com/h3/spec.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/spec"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$srcdir/spec"
  install -Dm0755 spec "$pkgdir"/usr/bin/spec
}
