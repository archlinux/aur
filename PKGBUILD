# Maintainer: itsme <mymail@ishere.ru>


pkgname=python-dnsimple
pkgdesc="Python client for DNSimple domain registration and DNS hosting"
pkgver=0.3.6
pkgrel=1
arch=('any')
url="https://github.com/onlyhavecans/dnsimple-python"
license=('MIT')
makedepends=('python-pip')
depends=('python' 'python-requests')
source=("https://github.com/onlyhavecans/dnsimple-python/archive/$pkgver.tar.gz")
md5sums=('2102b56025a75bb7c6dbdfc4d66b59fa')
sha256sums=('4a8fd76b83fadc282b8fd087af7c4f1f14657f880d71d5f06fe569cbbb0b3b11')


package() {
  cd $srcdir/dnsimple-python-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
