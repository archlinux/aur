# Maintainer: n0vember <n0vember at half-9 dot net>
pkgname=bash_unit
pkgver=114.7732279
pkgrel=1
pkgdesc="bash unit testing enterprise edition framework for professionals"
arch=('any')
url="https://github.com/pgrange/bash_unit"
license=('GPL')
depends=('bash')
source=(git+https://github.com/pgrange/bash_unit.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  true
}

package() {
  cd "$pkgname"

  install -Dm755 -o root -g root bash_unit "$pkgdir/usr/bin/bash_unit"
}

