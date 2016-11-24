# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=liblscp
pkgver=0.5.7
pkgrel=3
pkgdesc="LinuxSampler Control Protocol C++ library"
arch=('i686' 'x86_64')
url="http://www.linuxsampler.org/"
license=('LGPL')
source=(http://download.linuxsampler.org/packages/$pkgname-$pkgver.tar.gz)
md5sums=('c5409c61bc7242fcb3c009fef88bd899')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
