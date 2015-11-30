# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=wikiquote-fortune
pkgver=1.5
pkgrel=1
pkgdesc="Generate fortune cookies from Wikiquote"
arch=('any')
url="https://github.com/maandree/wikiquote-fortune"
license=('GPL3')
depends=('python' 'wget')
makedepends=('coreutils' 'make' 'texinfo')
source=(https://github.com/maandree/wikiquote-fortune/archive/${pkgver}.tar.gz)
sha256sums=(8bff426c4c1e5bb2a4254c87bdd74e037ba8944124fc540d94a3174bf626e8f6)


build() {
  cd "${srcdir}/wikiquote-fortune-${pkgver}"
  make
}


package() {
  cd "${srcdir}/wikiquote-fortune-${pkgver}"
  make install DESTDIR="${pkgdir}"
}

