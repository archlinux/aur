# Maintainer: Nikita (holos) holosnikitatt@gmail.com
pkgname=hobuild
pkgver=0.1
pkgrel=1
pkgdesc="A simple build system for Unix"
arch=('x86_64')
url="https://github.com/wholos/hobuild"
license=('GPL3')
depends=('gcc')
source=("https://github.com/wholos/hobuild/archive/refs/heads/main.zip")
sha256sums=('SKIP')

build() {
  cd "$srcdir/hobuild-main"
  gcc -o hobuild hobuild.c
}

package() {
  install -Dm755 "$srcdir/hobuild-main/hobuild" "$pkgdir/usr/bin/hobuild"
}
