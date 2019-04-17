#Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-powershell
pkgver=0.3.4
pkgrel=1
pkgdesc="An extension for colcon-core to provide PowerShell scripts."
arch=(any)
url="https://pypi.org/project/colcon-powershell/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/71/47/09e63a06b4d4df417323f37e4bb13a2629f41c8cea31dc3bbd7bc1d8d69f/colcon-powershell-${pkgver}.tar.gz")
sha256sums=('a0d7b5008fa2648cafbf19b8cd3310f1fde980ec5c0094bac746e8c56d02ee91')


package() {
    cd ${srcdir}/colcon-powershell-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
