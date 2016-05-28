# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

_pkgname=dexy-viewer
_pypiname=dexy_viewer
pkgname=python2-${_pkgname}
pkgver=0.0.5
pkgrel=1
pkgdesc="A plugin for dexy which enables the 'dexy viewer' command, running a local web server for previewing your dexy docs and snippets."
arch=('any')
url='https://github.com/ananelson/dexy-viewer'
license=('MIT')
depends=('python2'
         'python2-webpy')
makedepends=('python2-setuptools')
options=(!emptydirs)
provides=("${_pkgname}")
source=("https://pypi.python.org/packages/source/${_pypiname:0:1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('2c446451921b8d0728a60bbb5e616c7e')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
