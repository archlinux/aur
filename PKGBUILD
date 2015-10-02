# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=cheqlist
_pyname=cheqlist
pkgver=0.1.4
pkgrel=2
pkgdesc='A simple Qt checklist.'
arch=('any')
url='https://github.com/Kwpolska/cheqlist'
license=('BSD')
depends=('python' 'python-setuptools' 'python-pyqt5')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('90fd14fd33e05629c68ee08d867e5f60')
install=cheqlist.install

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
