# Maintainer: Catty Steve <cattysteve89265@163.com>
# Contributor: Nicholas Yam <nickyim05@gmail.com>

pkgname=python-aliyun-python-sdk-core
pkgver=2.15.1
pkgrel=1
pkgdesc="Alibaba Cloud SDK for Python"
arch=('any')
depends=('python-jmespath' 'python-cryptography')
makedepends=('python-setuptools')
url="https://github.com/aliyun/aliyun-openapi-python-sdk"
license=('Apache')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/3a/e6/f579e8a5e26ef1066f6fb11074cedc9f668cb5f722c85cf7adc0f7e2e23e/aliyun-python-sdk-core-2.15.1.tar.gz)
sha256sums=('518550d07f537cd3afac3b6c93b5c997ce3440e4d0c054e3acbdaa8261e90adf')

build() {
  cd "$srcdir/aliyun-python-sdk-core-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/aliyun-python-sdk-core-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
