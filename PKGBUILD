# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=vim-plugins-profiler
pkgver=1.8.1
pkgrel=2
pkgdesc="Utility to output a sorted list of VIM plugin startup times in millisec."
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('50bbc9e3b856b29fe53e0a97a1191838')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
