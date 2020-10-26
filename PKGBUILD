# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-cmake
_name=colcon-cmake
pkgver=0.2.26
pkgrel=1
pkgdesc="An extension for colcon-core to support CMake projects."
arch=(any)
url="https://pypi.org/project/colcon-cmake/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('f52c1fbd81674b3391b10677ae48c1d9092827ab1182a0f406fa87d4448154f7')


package() {
    cd ${srcdir}/colcon-cmake-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
sha256sums=('5a227fe812766be5fc3895c821bf9190f571e8c25eb73962967310d6b524349f')
sha256sums=('5a227fe812766be5fc3895c821bf9190f571e8c25eb73962967310d6b524349f')
