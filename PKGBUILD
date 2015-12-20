# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=python2-gitinspector
_pkgname=gitinspector
pkgver=0.4.3
pkgrel=1
pkgdesc="The statistical analysis tool for git repositories."
arch=('any')
url="http://code.google.com/p/gitinspector/"
license=('GPL')
depends=('python2' 'python2-setuptools')
makedepends=()
options=(!emptydirs)
source=("https://github.com/ejwa/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('11654fd409220beded37bec02610c0e2')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
