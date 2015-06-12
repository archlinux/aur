# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=jpp
pkgver=4.4
pkgrel=1
pkgdesc="Bash based preprocessor for Java"
arch=('any')
url="https://github.com/maandree/jpp"
license=('GPL3')
depends=('java-runtime>=5' 'bash')
provides=($pkgname)
conflicts=($pkgname)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(1e12176d497cc1e6473dd6298cbffbc24cbeb4eac7aa3f8cba87423392421660)

build() {
  cd jpp-${pkgver}
  make DESTDIR="$pkgdir/"
}

package() {
  cd jpp-${pkgver}
  make DESTDIR="$pkgdir/" install
}

