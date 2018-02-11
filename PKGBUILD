# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-aws-xray-sdk
_pkgname=aws-xray-sdk-python
pkgver=0.95
pkgrel=1
pkgdesc="AWS X-Ray SDK for Python"
arch=('any')
url="https://www.github.com/aws/aws-xray-sdk"
license=('Apache')
makedepends=()
depends=('python' 'python-requests' 'python-jsonpickle' 'python-wrapt')
checkdepends=('python-django' 'python-pytest' 'python-aiohttp')
source=("https://github.com/aws/aws-xray-sdk-python/archive/$pkgver.tar.gz")
sha256sums=('8ac94d28a6fb13897d98038ebc6e380a18cc09382907aef2c3120410850bd2ce')

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir || return 1
}

#check() {
#  cd $srcdir/$_pkgname-$pkgver
#  pytest
#}
