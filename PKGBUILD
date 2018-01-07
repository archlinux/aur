# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=vim-plugins-profiler
pkgver=1.1
pkgrel=1
pkgdesc="Utility to output a sorted list of VIM plugins startup times in millisec."
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('64fc84d7db57e3ba944c7e99ea5b2989')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
