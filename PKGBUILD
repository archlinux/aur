#Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-cmake
pkgver=0.2.4
pkgrel=1
pkgdesc="An extension for colcon-core to support CMake projects."
arch=(any)
url="https://pypi.org/project/colcon-cmake/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/b7/44/c23d6e2785ff71f609d959653a8db6d2e0cf8c36aa2f10f371d83ee61f00/colcon-cmake-$pkgver.tar.gz")
sha256sums=('e33d6c6947a1be7da1fa20e2b55cf40c49448e804a28513308097fc4a95e4d2c')


package() {
    cd ${srcdir}/colcon-cmake-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
