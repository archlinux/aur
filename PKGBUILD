# Maintainer: Nicholas Yam <nickyim05@gmail.com>

pkgname=python-aliyun-python-sdk-push
pkgver=3.10.1
pkgrel=2
pkgdesc="Alibaba Cloud SDK for Python"
arch=('any')
makedepends=('python-setuptools')
depends=('python-aliyun-python-sdk-core')
url="https://github.com/aliyun/aliyun-openapi-python-sdk"
license=('Apache License 2.0')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/90/80/3ec341d025957426e5a1dd763a3d14e78103babcaf15f3da8a5c34b94e16/aliyun-python-sdk-push-3.10.1.tar.gz)
sha256sums=('b341a90e80ee9f063f7ff5df6e4cf03eff9330eb11911f25bfb43852a5605cdd')

build() {
  cd "$srcdir/aliyun-python-sdk-push-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/aliyun-python-sdk-push-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
