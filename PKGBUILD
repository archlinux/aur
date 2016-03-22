_pypiname=py-amqplib
pkgname=python-amqplib
pkgver=1.0.2
pkgrel=1
pkgdesc="AMQP Client Library"
arch=(any)
source=("https://github.com/barryp/py-amqplib/archive/${pkgver}.tar.gz")
license=("LGPL")
makedepends=("python" "python-setuptools")
md5sums=('ff405a7b57aa98cdf07d02bd8090fa29')

package() {
  cd "$_pypiname-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
