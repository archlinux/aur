pkgname=python2-dis3
_altname=python-dis3
pkgver=0.1.3
pkgrel=2
pkgdesc='Python 2.7 backport of the "dis" module from Python 3.5+'
arch=('any')
url="https://github.com/KeyWeeUsr/${_altname}"
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2')
source=("${_altname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('091f8a2c4f411e8c044760127524c577dc2b259fd1eb0a037f37f99e328f70f4')

package() {
  cd "${srcdir}/${_altname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
