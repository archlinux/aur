# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: froggie <sullivanva@gmail.com>

pkgname=untex
pkgver=1.3
pkgrel=3
pkgdesc="A tool for removing LaTeX commands from input"
arch=('i686' 'x86_64')
url="ftp://ftp.thp.uni-duisburg.de/pub/source/"
license=('GPL')
depends=('glibc')
source=(ftp://ftp.thp.uni-duisburg.de/pub/source/$pkgname-$pkgver.tar.gz)
md5sums=('909da862cdccea0f6987467be72f103a')


build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.man "$pkgdir"/usr/share/man/man1/$pkgname.1
}

