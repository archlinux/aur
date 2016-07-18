# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=cheqlist
_pyname=cheqlist
pkgver=0.3.0
pkgrel=1
pkgdesc='A simple Qt checklist.'
arch=('any')
url='https://github.com/Kwpolska/cheqlist'
license=('BSD')
depends=('python' 'python-setuptools' 'python-pyqt5')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b2da6d8d6c00aaf8c7a65546c43203a4')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
