# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=python2-gitinspector
_pkgname=gitinspector
pkgver=0.3.2
pkgrel=2
pkgdesc="The statistical analysis tool for git repositories."
arch=('any')
url="http://code.google.com/p/gitinspector/"
license=('GPL')
depends=('python2' 'python2-setuptools')
makedepends=()
options=(!emptydirs)
source=("http://${_pkgname}.googlecode.com/files/${_pkgname}_${pkgver}.zip")
md5sums=('e1cbc2c5883c161f0deab8eb4cf025ad')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
