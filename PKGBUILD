# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=python-twitter
pkgver=1.17.1
pkgrel=2
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
sha256sums=('9e998dce881615d5c62579462ad7ed9751ddaed88072f268edf9c0e58f6d700b')

package() {
  cd "$srcdir/twitter-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}
