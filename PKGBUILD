# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-package-selection
pkgver=0.2.4
pkgrel=1
pkgdesc="An extension for colcon-core to select a subset of packages for processing."
arch=(any)
url="https://pypi.org/project/colcon-package-selection"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/44/06/e711df6598847437a62368bc581b8beddbea788f73641db08e0be05f22cb/colcon-package-selection-0.2.4.tar.gz)
sha256sums=('aaf3a93516c0b6e3233475a417aaf828914e4d600e3848323f0833b72e917d88')


package() {
    cd ${srcdir}/colcon-package-selection-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
