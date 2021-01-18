# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pkglog
pkgver=1.1
pkgrel=1
pkgdesc="Reports log of package updates"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.7")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('cf733bcb69343b9c1f9f52d770c86c751e6a0aad')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
