# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=texman
pkgver=1.0
pkgrel=1
pkgdesc='Texinfo-like syntax for manpages'
arch=('any')
url='https://github.com/maandree/texman'
license=('GPL3')
depends=('perl')
makedepends=('perl' 'gzip' 'sed' 'coreutils' 'make')
source=(https://github.com/maandree/texman/archive/1.0.tar.gz)
sha256sums=(2eaffe293112baee4a4c98cefe70c74802c3065514020aae9fa8ab29756214ac)


build() {
  cd "texman-${pkgver}"
  make
}

package() {
  cd "texman-${pkgver}"
  make DESTDIR="$pkgdir" install
}

