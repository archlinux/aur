# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=librsskit
_pkgname=RSSKit
pkgrel=1
pkgver=0.4
pkgdesc="A simple library for reading the different types of RSS file formats."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/grr/index.html"
license=('GPL')
groups=('gnustep')
depends=('gnustep-base')
makedepends=('gcc-objc'
             'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz")
sha256sums=('5dffff7005468aacc45c117a1c86b0d0e72e0d617b35c79b820973390b3a8886')

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
