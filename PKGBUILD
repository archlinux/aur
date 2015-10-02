# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=checkoutmanager
pkgver=2.4.1
pkgrel=1
pkgdesc="Gives you overview and control over your git/hg/bzr/svn checkouts/clones"
arch=('any')
url="https://pypi.python.org/pypi/checkoutmanager"
license=('GPL')
depends=('python')
source=("https://pypi.python.org/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('cff92bff9014d81a402d9c332e074ec6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
