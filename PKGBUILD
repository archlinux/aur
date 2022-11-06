# Maintainer: Hongbin Ma <mathmhb@139.com>

pkgname=python-torch-points3d
_pkgname=torch_points3d
pkgver=1.3.0
pkgrel=1
_file=
pkgdesc="Point Cloud Deep Learning Extension Library for PyTorch"
url="https://pypi.org/project/${_pkgname//_/-}/"
arch=('any')
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('abc546c2023d150518614318042772767d9cc2043e538a6152dea3441781bd39')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
