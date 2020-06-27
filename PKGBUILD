# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pylnk3
_pypiname=pylnk3
pkgver=0.3.0
pkgrel=1
pkgdesc="Python library for reading and writing Windows shortcut files (.lnk)."
url="https://pypi.org/project/pylnk3/"
arch=('any')
license=('LGPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/66/88/099931184b02b4eee2195f23c333c0bb1e0cc3d00cc08112deef901c12a7/pylnk3-${pkgver}.tar.gz")
sha256sums=('6202a2b4bd9c6efe6d070dd9d93d501702f48f27d4873e2dfddc8d996499b684')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
