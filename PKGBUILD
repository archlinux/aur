# Maintainer: Nicholas Yam <nickyim05@gmail.com>

pkgname=python-aliyun-python-sdk-core
pkgver=2.13.4
pkgrel=1
pkgdesc="Alibaba Cloud SDK for Python"
arch=('any')
#depends=('python-flask')
makedepends=('python-setuptools')
url="https://github.com/aliyun/aliyun-openapi-python-sdk"
license=('Apache License 2.0')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/b5/02/b9237a788248b80925832b17a0839d7a46edb7ec7c9c88128191581ea50f/aliyun-python-sdk-core-2.13.4.tar.gz)
sha256sums=('3df9dcab300312212c7bd603c463c6472d17bb7e272a0a2d276dc2676c8ee1c3')

build() {
  cd "$srcdir/aliyun-python-sdk-core-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/aliyun-python-sdk-core-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
