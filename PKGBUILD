# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=checkoutmanager
pkgver=2.0
pkgrel=1
pkgdesc="Gives you overview and control over your git/hg/bzr/svn checkouts/clones"
arch=('any')
url="https://pypi.python.org/pypi/checkoutmanager"
license=('GPL')
depends=('python2')
source=("https://pypi.python.org/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('cb1d6bec60c08492f26d409d3ac34a0a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
