# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
pkgname=python2-duckduckgo2
_realname=duckduckgo2
pkgver=0.242
pkgrel=1
pkgdesc="Library for querying the DuckDuckGo API"
arch=("any")
url="http://pypi.python.org/pypi/duckduckgo2"
license=('BSD')
depends=('python2')
source=("http://pypi.python.org/packages/source/d/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('d9668a03c41a34d7a43275303172cc3e')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
