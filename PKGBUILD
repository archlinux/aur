# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-test-result
pkgver=0.3.3
pkgrel=1
pkgdesc="An extension for colcon-core to provide information about the test results."
arch=(any)
url="https://pypi.org/project/colcon-test-result"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/03/c2/0c98c7bb1ebc3685fe02e62320955803e0bbbd3f80ea709eb0e4af6910ee/colcon-test-result-0.3.3.tar.gz)
sha256sums=('78f7d761418d2aa44b111b425db8d06294a2e3915d4f360f72336bb8966614a3')


package() {
    cd ${srcdir}/colcon-test-result-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
