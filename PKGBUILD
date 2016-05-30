# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=gitinspector
pkgver=0.4.4
pkgrel=1
pkgdesc="The statistical analysis tool for git repositories."
arch=('any')
url="http://code.google.com/p/gitinspector/"
license=('GPL')
depends=('python2' 'python2-setuptools')
makedepends=()
options=(!emptydirs)
source=("https://github.com/ejwa/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('3208154173adafc314a3334a5242bf59')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
