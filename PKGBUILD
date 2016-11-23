# Maintainer: M0Rf30

pkgname=python2-pyelliptic
pkgver=1.5.7
pkgrel=1
pkgdesc="Python OpenSSL wrapper. For modern cryptography with ECC, AES, HMAC, Blowfish..."
arch=(any)
url="https://github.com/yann2192/pyelliptic"
license=('GPL3')
depends=('openssl')
source=(https://pypi.python.org/packages/source/p/pyelliptic/pyelliptic-$pkgver.tar.gz)
provides=('python2-pyelliptic')

package(){
  cd $srcdir/pyelliptic-$pkgver
  python2 setup.py install --root="$pkgdir"
}

md5sums=('39ab176ea768a0434c5a5f71611300e0')
