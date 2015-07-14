# Contributor: Kevin Brubeck Unhammer <unhammer+dill@mm.st>
# Maintainer: Kevin Brubeck Unhammer <unhammer+dill@mm.st>
pkgname=ordbanken
pkgver=2013.02.17
upstreampkgver=2013-02-17
pkgrel=1
pkgdesc="Look up Norwegian Nynorsk or Bokmål words in an inflectional dictionary"
url="http://huftis.org/artiklar/ordbanken/"
license=('GPL3')
makedepends=('')
depends=('util-linux-ng' 'sh')
arch=('i686' 'x86_64')
source=("http://download-mirror.savannah.gnu.org/releases/$pkgname/$pkgname-$upstreampkgver.tar.xz")
md5sums=('c2abe87b472da23423734a52a8d7a609')

build() {
  cd "$srcdir/$pkgname"

  make PREFIX="/usr" || return 1
  make PREFIX="/usr" DESTDIR="$pkgdir/" install || return 1
}
