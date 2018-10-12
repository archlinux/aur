# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-mpl-scatter-density
_pyname=mpl-scatter-density
pkgver=0.4
pkgrel=1
pkgdesc="Fast scatter density plots for Matplotlib"
arch=('i386' 'x86_64')
url="https://github.com/astrofrog/mpl-scatter-density"
license=('CUSTOM')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-fast-histogram')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/da/55/c15a810a6e15aa0d12ec2ba0dc444696af8576a1c17ca61d196be5070bad/${_pyname}-${pkgver}.tar.gz)
sha256sums=('0ddffbfa0e54fb9ea0032595ef868870a77ef2e87fb1fce935527026fb01099d')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

