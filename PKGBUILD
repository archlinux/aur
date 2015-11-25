# Maintainer: Xavier de Gaye <xdegaye[at]gmail[dot]com>

pkgname=python2-etc-merge
_pyname=etc-merge
pkgver=0.1
pkgrel=1
pkgdesc="A tool to track /etc files and .pacnew files using mercurial"
arch=('any')
url="https://bitbucket.org/xdegaye/etc-merge"
license=('GPL3')
depends=('python2-hglib' 'vim')
makedepends=('python2')
optdepends=('DirDiff: to view the changes')
source=(https://pypi.python.org/packages/source/e/${_pyname}/${_pyname}-${pkgver}.tar.gz)
md5sums=('45f85ccc2ebd201a8dd10a783370e26f')

package() {
  cd ${_pyname}-${pkgver}

  /usr/bin/python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vi:set ts=8 sts=4 sw=4 et tw=78:
