# Maintainer: envolution
# Contributor: Franz Müller <ethylisocyanat@gmail.com>

pkgname=python-descartes
_pyname=descartes
pkgver=1.1.0
pkgrel=2
pkgdesc='Python lib for using geometric objects as matplotlib paths and patches.'
arch=('any')
url='https://bitbucket.org/sgillies/descartes/'
license=('custom')
depends=('python')
source=('https://files.pythonhosted.org/packages/1d/6f/81735a30432b74f41db6754dd13869021ccfed3088d1cf7a6cfc0af9ac49/descartes-1.1.0.tar.gz')
sha256sums=('135a502146af5ed6ff359975e2ebc5fa4b71b5432c355c2cafdc6dea1337035b')
makedepends=('python-setuptools')

build() {
  cd $_pyname-$pkgver
  python setup.py build
}

package() {
  cd $_pyname-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
