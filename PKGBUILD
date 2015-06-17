# Maintainer: M0Rf30

_pkgname=python2-pyelliptic
pkgname=$_pkgname-git
pkgver=69.7810c7a
pkgrel=1
pkgdesc="Python OpenSSL wrapper. For modern cryptography with ECC, AES, HMAC, Blowfish..."
arch=(any)
url="https://github.com/yann2192/pyelliptic"
license=('GPL3')
depends=('openssl')
makedepends=('git')
source=('pyelliptic::git+https://github.com/yann2192/pyelliptic.git')
conflicts=('python2-pyelliptic')

package(){
  cd pyelliptic
  python2 setup.py install --root="$pkgdir"
}

pkgver() {
  cd pyelliptic
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
