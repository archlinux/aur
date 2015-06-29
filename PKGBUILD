# Maintainer: Tetsumi <tetsumi@vmail.me>

pkgname=wren-git
_gitname=wren
pkgver=0
pkgrel=1
pkgdesc="Wren is a small, fast, class-based concurrent scripting language"
arch=("i686" "x86_64")
url="http://munificent.github.io/wren/"
source=("git://github.com/munificent/wren.git")
md5sums=('SKIP')

build() {
  cd $_gitname
  make release
}

package() {
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/$_gitname/bin/wren" "$pkgdir/usr/bin/wren"
}
 
