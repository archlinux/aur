# Maintainer: S.Leduc <sebastien@sleduc.fr>

pkgname=pymunin
_pkgname=PyMunin
pkgver=0.9.27
pkgrel=2
pkgdesc="Python Module for developing Munin Multigraph Monitoring Plugins."
arch=("any")
url="http://aouyar.github.com/PyMunin/"
license=('GPL3')
depends=('python2' 'munin-node')
makedepends=('python2-setuptools')
install=$pkgname.install
source=("http://pypi.python.org/packages/source/P/PyMunin/$_pkgname-$pkgver.tar.gz")
md5sums=('2694c500de4b63f75b62ed5d06f8dd05')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
