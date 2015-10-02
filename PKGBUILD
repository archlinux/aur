# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=pip-tools
pkgver=1.1.4
pkgrel=1
pkgdesc="A set of tools to keep your pinned Python dependencies fresh."
arch=('any')
url="https://github.com/nvie/pip-tools"
license=('BSD')
depends=('python' 'python-click' 'python-six')
source=("http://pypi.python.org/packages/source/p/pip-tools/$pkgname-$pkgver.tar.gz")
md5sums=('d4c8d2d53f565768147174e39c085ebd')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
