# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=liblscp
pkgver=0.5.6
pkgrel=2
pkgdesc="LinuxSampler Control Protocol C++ library"
arch=('i686' 'x86_64')
url="http://www.linuxsampler.org/"
license=('LGPL')
source=(http://download.linuxsampler.org/packages/$pkgname-$pkgver.tar.gz)
md5sums=('f5f076af8fd83767889a66abc1da21d5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
