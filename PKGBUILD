# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-mpl-scatter-density
_pyname=mpl-scatter-density
pkgver=0.7
pkgrel=1
pkgdesc="Fast scatter density plots for Matplotlib"
arch=('i386' 'x86_64')
url="https://github.com/astrofrog/mpl-scatter-density"
license=('CUSTOM')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-fast-histogram')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/97/e0/98dd3223d6306a35d3fbd67ebf9473be6341d6e733a57768825205786021/${_pyname}-${pkgver}.tar.gz)
sha256sums=('cace750887916d3881b3a42ab5805769cc8d7eb70ef610938cbb57c967277620')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

