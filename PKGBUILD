# Maintainer: Catty Steve <cattysteve89265@163.com>
# Contributor: Nicholas Yam <nickyim05@gmail.com>

pkgname=python-aliyun-python-sdk-core
pkgver=2.16.1
pkgdesc="Alibaba Cloud SDK for Python"
arch=('any')
depends=('python-jmespath' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-wheel')
url="https://github.com/aliyun/aliyun-openapi-python-sdk"
license=('Apache')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/ea/38/eb3be49159d6442e68189f21a2205a199b51ca46cf42a3f874e695ff0ba9/aliyun_python_sdk_core-2.16.1-py3-none-any.whl)
sha256sums=('0f25a6e8ec1ea29c76610278cff81cbff85149a6e692bf2398a6f9b77e5e7424')

package() {
  python -m installer --destdir="$pkgdir" aliyun_python_sdk_core-*.whl
}
