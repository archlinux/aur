# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=javagen
pkgver=1.2.1
pkgrel=1
pkgdesc="Collection of small code generators for Java"
arch=('any')
url="https://github.com/maandree/javagen"
license=('GPL')
depends=('java-runtime>=6')
makedepends=('java-environment>=6')
provides=('javagen')
conflicts=('javagen')
source=("https://github.com/maandree/javagen/archive/${pkgver}.tar.gz")
sha256sums=(fcde1c21b26c47a227d420b063df54530e6c78f6dc7ebc65e391b641e6e2414f)

build() {
  cd javagen-${pkgver}
  make
}

package() {
  cd javagen-${pkgver}
  make DESTDIR="$pkgdir/" install
}
