# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Submitter: Simon Zack <simonzack@gmail.com>
# Contributor: Santi Villalba <sdvillal@gmail.com>

pkgname=python-guessit
pkgver=3.1.1
pkgrel=1
pkgdesc="A library for guessing information from video files."
arch=(any)
url="http://pypi.python.org/pypi/guessit"
license=(LGPL)
depends=(python python-babelfish python-dateutil python-rebulk)
makedepends=("python-setuptools")
conflicts=(${pkgname}-git)
source=(https://github.com/guessit-io/guessit/archive/${pkgver}.tar.gz)
sha256sums=('dccb66d6d80963382753e9a456a28f8f7da10b9932e96e42bccc74a081cd2e8c')

package() {
    cd "${srcdir}/guessit-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
