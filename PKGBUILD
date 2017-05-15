# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Submitter: Simon Zack <simonzack@gmail.com>
# Contributor: Santi Villalba <sdvillal@gmail.com>

pkgname=python-guessit
pkgver=2.1.2
pkgrel=1
pkgdesc="A library for guessing information from video files."
arch=(any)
url="http://pypi.python.org/pypi/guessit"
license=(LGPL)
makedepends=(python-pytest-runner)
depends=(python python-babelfish python-dateutil python-rebulk)
conflicts=(${pkgname}-git)
source=(https://github.com/guessit-io/guessit/archive/${pkgver}.tar.gz)
sha256sums=('9214462baf08037ea8fc694db54129820f7508609b827e3f8bbf4a730f1677db')

package() {
    cd "${srcdir}/guessit-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
