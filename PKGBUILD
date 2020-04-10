# Maintainer: D. Murphy (archerdm)

pkgname=cackey
pkgver=0.7.10
pkgrel=1
pkgdesc="CACKey PKCS#11 Provider for US Department of Defense CACs"
arch=('x86_64')
url="https://cackey.rkeene.org/fossil/home"
license=('multiple')
depends=('glibc' 'zlib' 'pcsclite')
source=('http://cackey.rkeene.org/download/0.7.10/cackey-0.7.10.tar.gz')
sha256sums=('e2074055bab8eb1c277bfa3355767c50f792d5b87bf41f9c0d1af0e77f311583')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=$pkgdir/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install
}
