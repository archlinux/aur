# Maintainer: Bruce Zhang
pkgbase=python-aliyunsdkcore
pkgname='python-aliyunsdkcore'
pkgver=1.0.3
pkgrel=1
pkgdesc="This is the core module of Aliyun Python SDK."
arch=('any')
url="https://github.com/duangy/aliyunsdkcore"
license=('Apache')
makedepends=('python-setuptools')
depends=('python-pycryptodomex')
source=("https://pypi.io/packages/source/a/aliyunsdkcore/aliyunsdkcore-$pkgver.tar.gz")
sha512sums=('cb19f8817db156e9723b3d465b42cf9e06c33dcec6cb1ae1a6d7e870182343af9cbd7353918c35f3b51b693de727ff03db52fbf71f1fca1a8d053cfae6a8c861')

build() {
  cd "$srcdir"/aliyunsdkcore-$pkgver
  python setup.py build
}

package() {
  cd aliyunsdkcore-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
