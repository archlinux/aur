#Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-metadata
pkgver=0.2.2
pkgrel=1
pkgdesc="An extension for colcon-core to fetch and manage package metadata from repositories."
arch=(any)
url="https://pypi.org/project/colcon-metadata/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/b8/ed/e15737df4f0553f9e4e322fb299d5bebfe78ef0ac444818a53867ef35486/colcon-metadata-0.2.2.tar.gz)
sha256sums=('0b0fdfa657444bd3266459208460494f0d8b4d6a607e618db0904f54c4e64250')


package() {
    cd ${srcdir}/colcon-metadata-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
