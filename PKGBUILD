# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=think
_pyname=think
pkgver=0.1.0
pkgrel=1
pkgdesc='Terminal Think Music'
arch=('any')
url='https://github.com/Kwpolska/think'
license=('BSD')
depends=('python' 'python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('4d5f931942326f6b3e2f520ddcdd0808')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
