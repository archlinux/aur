# Maintainer: M0Rf30

pkgname=python2-pyelliptic
pkgver=1.5.8
pkgrel=1
pkgdesc="Python OpenSSL wrapper. For modern cryptography with ECC, AES, HMAC, Blowfish..."
arch=(any)
url="https://github.com/yann2192/pyelliptic"
license=('GPL3')
depends=('openssl')
source=(https://github.com/yann2192/pyelliptic/archive/$pkgver.tar.gz)

package(){
  cd $srcdir/pyelliptic-$pkgver
  python2 setup.py install --root="$pkgdir"
}
md5sums=('ce185fdefe4bfa2ede5ed7e41fa0e8d4')
