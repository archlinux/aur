# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgname=paypal
pkgname=python2-$_pkgname
pkgver=1.2.1
pkgrel=1
pkgdesc="PayPal API implementation in Python"
arch=('any')
url='https://github.com/duointeractive/paypal-python/'
license=('APACHE')
depends=('python2' 'python2-requests')
source=("http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
}

sha512sums=('42feb0ca1d3af111a657d784085c720d5546ab217e9f2af576acc3acb307bcf4608bb0c328b77fd39b6264cec8eb2f6c204ac52ce08c1bee40c9c90d8a9e4069')
