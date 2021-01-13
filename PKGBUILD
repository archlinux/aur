# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.12.5
pkgrel=1
pkgdesc="A collection of utilities for creating interactive console scripts"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')
optdepends=('python-pyfiglet: Figlet banner printing')

source=("https://files.pythonhosted.org/packages/source/i/interutils/interutils-0.12.5.tar.gz")
sha256sums=("6bd2ba7d262cff57976f19ab958d30cc77b59e3ab75bdbc2b100e92634bf374a")

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

