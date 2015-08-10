# Maintainer: Carmen Bianca Bakker <carmenbbakker@gmail.com>
pkgname=pyparadox
pkgver=0.3.4
pkgrel=1
pkgdesc='PyParadox is a nix launcher for Paradox titles.'
arch=('any')
url='https://gitlab.com/carmenbbakker/pyparadox'
license=('GPL3')
depends=('python>=3.3' 'python-pyqt5' 'python-appdirs')
makedepends=('python-setuptools')
optdepends=('qt5-quickcontrols')
source=("https://pypi.python.org/packages/source/p/pyparadox/pyparadox-${pkgver}.tar.gz")
md5sums=('fbd90518332abd8223c8e9d1de8a6433')

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}/"
}
