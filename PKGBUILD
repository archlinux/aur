# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=checkoutmanager
pkgver=2.5
pkgrel=1
pkgdesc="Gives you overview and control over your git/hg/bzr/svn checkouts/clones"
arch=('any')
url="https://pypi.python.org/pypi/checkoutmanager"
license=('GPL')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('245e78b952098c1ae3cde26d557c0322')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
