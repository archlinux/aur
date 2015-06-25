# Maintainer : Simon Désaulniers <rostydela@gmail.com>
pkgname='python2-lmgtfy'
pkgver='0.1.2'
pkgrel=1
arch=('any')
pkgdesc='"Let me Google that for you" command line tool.'
url='https://pypi.python.org/pypi/lmgtfy'
license=('MIT')
depends=('python2' 'xclip' 'python2-requests')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/l/lmgtfy/lmgtfy-0.1.2.tar.gz")
sha256sums=('ed959af97394542522ebe4167bebc735324ee95fd64969be14e1cc576402cec6')

package () {
  cd "${srcdir}/${pkgname#*-}-${pkgver}"

  python2.7 setup.py bdist --dist-dir .
  tar -xvzf lmgtfy-0.1.2.*.tar.gz -C $pkgdir
}
# vim:set ts=2 sw=2 et:
