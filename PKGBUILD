# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-pytest-repeat
pkgver=0.8.0
pkgrel=1
pkgdesc="pytest-repeat is a plugin for py.test that makes it easy to repeat a single test, or multiple tests, a specific number of times."
arch=(any)
url="https://pypi.org/project/pytest-repeat"
license=('BSD')
depends=('python-six' 'python-attrs' 'python-atomicwrites' 'python-pluggy' 'python-more-itertools' 'python-pytest')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/1a/ef/a721646e592e834ad93e1c880956b3d6ff060c623c2e317170f5747d9c71/pytest-repeat-0.8.0.tar.gz")
sha256sums=('52bc413ab1a772e72c953a5592196ddd266fd2e76280eaac0c2a8378e9ac6dd9')

package() {
    cd ${srcdir}/pytest-repeat-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
