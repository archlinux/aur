# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-output
pkgver=0.2.3
pkgrel=1
pkgdesc="An extension for colcon-core to customize the output in various ways."
arch=(any)
url="https://pypi.org/project/colcon-output/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/d2/3f/90578a9463d5af5160292f036f147bd316278577399958db77eb179cee78/colcon-output-$pkgver.tar.gz")
sha256sums=('b0ce32be24ae33a50e70021c5965ef3b10df6aa4497d894f3ad5b230cf01ab56')


package() {
    cd ${srcdir}/colcon-output-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
