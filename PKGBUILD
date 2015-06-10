# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=python-twitter
pkgver=1.17.0
pkgrel=1
pkgdesc='An API and command-line toolset for Twitter (twitter.com)'
arch=('any')
url='http://pypi.python.org/pypi/twitter/'
license=('MIT')
depends=('python')
optdepends=('python-irclib: twitterbot utility dependency')
replaces=('python-twitter-tools')
makedepends=('python-setuptools')
conflicts=('python-twitter-tools' 'python-twitter-tools-git' 'python-twitter-git')
source=("http://pypi.python.org/packages/source/t/twitter/twitter-${pkgver}.tar.gz")
sha256sums=('85396c4c33b9b213f3d2d805caaf6b386b9e277af9117eb51e5a782f77257376')

package() {
  cd "$srcdir/twitter-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}
# vim:set ts=2 sw=2 et:
