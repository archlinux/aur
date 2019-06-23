# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-package-information
pkgver=0.2.2
pkgrel=1
pkgdesc="An extension for colcon-core to provide information about the packages."
arch=(any)
url="https://pypi.org/project/colcon-package-information/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/2d/34/3571034051350571b4c885258ddb9b600ddd6abcd8cf94799f314e97a961/colcon-package-information-0.2.2.tar.gz)
sha256sums=('4d34a0c05ca6c94679ef37b8166895f41343919de051bb884af8010c10afdcfa')


package() {
    cd ${srcdir}/colcon-package-information-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
