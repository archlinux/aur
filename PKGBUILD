# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=clogs
pkgver=1.5.0
pkgrel=1
pkgdesc="C++ library for sorting and searching in OpenCL applications"
arch=(x86_64 i686)
url="http://sourceforge.net/projects/clogs/"
license=(MIT)

source=("http://skylink.dl.sourceforge.net/project/clogs/1.5.0/clogs-1.5.0.tar.bz2")
sha256sums=("SKIP")

build() {
  cd $pkgname-$pkgver
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd $pkgname-$pkgver
  python2 waf install --destdir=$pkgdir
}
