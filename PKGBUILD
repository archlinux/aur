# Maintainer: xhyinne <xhyi AT gmx DOT us>

pkgname=xcat
pkgver=0.2
pkgrel=1
pkgdesc="A simple cat clone with xor key"
arch=('any')
url="https://gist.github.com/xdrie/c3081151707a071acf1aea53d0d1bfd5"
license=('MIT')
source=("https://gist.githubusercontent.com/xdrie/c3081151707a071acf1aea53d0d1bfd5/raw/4de694d03a953b5b0e5613d2fadca542a7741677/xcat.c")
sha256sums=('25a7650da7d1658313a547732d67f4f39f701c1404ade0de3d63fccd701b1836')

build() {
  cd "${srcdir}"

  gcc -O3 -Wall -o xcat xcat.c
}

package() {
  cd "${srcdir}"

  mkdir -p "$pkgdir/usr/bin"
  cp xcat "$pkgdir/usr/bin/xcat"
}
