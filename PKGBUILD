# Maintainer: Nicholas Yam <nickyim05@gmail.com>

pkgname=python-aliyun-python-sdk-core
pkgver=2.14.0
pkgrel=1
pkgdesc="Alibaba Cloud SDK for Python"
arch=('any')
depends=('python-jmespath')
makedepends=('python-setuptools')
url="https://github.com/aliyun/aliyun-openapi-python-sdk"
license=('Apache')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/1e/e3/8623c0305022610466ded2b0010a7221e9585046116263dd27cb2e56df36/aliyun-python-sdk-core-2.14.0.tar.gz)
sha256sums=('c806815a48ffdb894cc5bce15b8259b9a3012cc0cda01be2f3dfbb844f3f4f21')

build() {
  cd "$srcdir/aliyun-python-sdk-core-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/aliyun-python-sdk-core-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
