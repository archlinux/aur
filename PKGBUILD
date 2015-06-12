# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=pip-tools
pkgver=0.3.6
pkgrel=1
pkgdesc="A set of tools to keep your pinned Python dependencies fresh."
arch=('any')
url="https://github.com/nvie/pip-tools"
license=('BSD')
depends=('python2')
source=("http://pypi.python.org/packages/source/p/pip-tools/$pkgname-$pkgver.tar.gz")
md5sums=('931183954992b1f381aaff688be6a227')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
