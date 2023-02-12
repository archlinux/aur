# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

_pkgname="pnginfo"
pkgname="pnginfo-git"
pkgdesc="The pnginfo utility explores the content of PNG files."
pkgver=0.47b50b4
pkgrel=1
arch=('x86_64')
url="https://github.com/tleguern/pnginfo"
license=('ISC')
source=("git+$url")
sha512sums=('SKIP')

build() {
  cd "$_pkgname"
  ./configure PREFIX=/usr
  make
}

package() {
  cd "$_pkgname"
  install -D     -t "$pkgdir"/usr/bin pnginfo
}
