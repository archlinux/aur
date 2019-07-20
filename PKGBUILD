# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-globre
_pypiname=globre
pkgver=0.1.5 
pkgrel=1
pkgdesc="A glob matching library, providing an interface similar to the "re" module."
url="https://pypi.org/project/globre/"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/5a/ce/a9e2f3317a458f8c591a1f95d4061d4e241f529ba678292acdcf2d804783/globre-${pkgver}.tar.gz")
sha256sums=('ee214204f237e9114b8f61eeb61c2abd1e665ca3b59e5a6a0b070971c0bb12e2')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
