#Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-cmake
pkgver=0.2.13
pkgrel=1
pkgdesc="An extension for colcon-core to support CMake projects."
arch=(any)
url="https://pypi.org/project/colcon-cmake/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/95/55/9717b72bd932f68a4c6e8ce2f03e51b6aa9f45b105233dffbe47f0b3f041/colcon-cmake-0.2.13.tar.gz)
sha256sums=('f52c1fbd81674b3391b10677ae48c1d9092827ab1182a0f406fa87d4448154f7')


package() {
    cd ${srcdir}/colcon-cmake-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
