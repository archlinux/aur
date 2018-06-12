# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=vim-plugins-profiler
pkgver=1.8
pkgrel=1
pkgdesc="Utility to output a sorted list of VIM plugin startup times in millisec."
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('10b0b0dc2a4a8bf94239bd51732d11d7')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
