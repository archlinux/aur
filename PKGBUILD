# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Submitter: Simon Zack <simonzack@gmail.com>
# Contributor: Santi Villalba <sdvillal@gmail.com>

pkgname=python-guessit
pkgver=2.1.1
pkgrel=1
pkgdesc="A library for guessing information from video files."
arch=(any)
url="http://pypi.python.org/pypi/guessit"
license=(LGPL)
makedepends=(python-pytest-runner)
depends=(python python-babelfish python-dateutil python-rebulk)
conflicts=(${pkgname}-git)
source=(https://github.com/guessit-io/guessit/archive/${pkgver}.tar.gz)
sha256sums=('541ca3c3485218b140d97885755b91ebcb9402639471c77e31a5816ffdbb2567')

package() {
    cd "${srcdir}/guessit-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
