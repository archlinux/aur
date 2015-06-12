# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=secnote
pkgver=1.1
pkgrel=1
pkgdesc="Secure note taking"
arch=('any')
url="https://github.com/maandree/$pkgname"
license=('GNUAllPermissiveLicense')
depends=('gnupg')
provides=($pkgname)
conflicts=($pkgname)
source=($url/tarball/$pkgver)
md5sums=(899f0415f35480480b458794091e2fb5)

build() {
  cd maandree-${pkgname}-*
  make -B DESTDIR="$pkgdir/"
}

package() {
  cd maandree-${pkgname}-*
  make DESTDIR="$pkgdir/" install
}

