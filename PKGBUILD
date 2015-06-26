# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=kerf-git
pkgver=20150625
pkgrel=1
pkgdesc="a columnar tick database written in C and speaks JSON and SQL"
url="https://github.com/kevinlawler/kona"
arch=('x86_64')
license=('custom:unknown')
depends=()
makedepends=('git')
source=('git://github.com/kevinlawler/kerf.git')
md5sums=('SKIP')
_gitname="kerf"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  # someday, I hope
  return 0
}

package() {
  cd "$_gitname"
  install -Dm755 KerfREPL/linux/kerf "$pkgdir/usr/bin/kerf"
}
