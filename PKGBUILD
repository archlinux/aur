# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=sets
pkgver=1.3
pkgrel=1
pkgdesc="The practical way to do set operations on sets of lines in the shell"
arch=('any')
url="https://github.com/maandree/sets"
license=('AGPL3')
depends=('python>=3')
provides=($pkgname)
conflicts=($pkgname)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(3f0f7fa0918991530f51f1c5d066e662a4e19169eda14295d6f3ff261c70bcce)

build() {
  cd sets-$pkgver
  make DESTDIR="$pkgdir/"
}

package() {
  cd sets-$pkgver
  make DESTDIR="$pkgdir/" install
}
