pkgname=scrapfetch-pkg
pkgver=1.0
pkgrel=1
pkgdesc="A tool for fetching system information. Written in C for Linux."
arch=('x86_64')
url="https://github.com/amodi444/scrapfetch"
license=('GPLv3')
depends=("glibc")
source=("git+https://github.com/amodi444/scrapfetch.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
