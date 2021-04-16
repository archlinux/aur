# Maintainer: Robert Falkenberg <robert.falkenberg@tu-dortmund.de>

pkgname=python-pytlv
_pyname=pytlv
pkgver=0.71
pkgrel=1
pkgdesc='TLV(tag length value) data parser, especially useful for EMV tags parsing'
arch=('any')
url='https://github.com/timgabets/pytlv'
license=('LGPL2.1')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/bf/fb/05cb227d725bae7fce250c5b4706442d74e94e3f5faa655efd4621ed559c/${_pyname}-${pkgver}.tar.gz")
md5sums=('a5524ed1c8e7ca26f4408a15d6570b7f')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
