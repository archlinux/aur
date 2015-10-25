# Maintainer: Simon Zack <simonzack@gmail.com>
# Submitter: Simon Zack <simonzack@gmail.com>
# Contributor: Santi Villalba <sdvillal@gmail.com>

pkgname=python-guessit
pkgver=0.10.3
pkgrel=2
pkgdesc="A library for guessing information from video files."
arch=(any)
url="http://pypi.python.org/pypi/guessit"
license=(LGPL)
depends=(python python-babelfish python-stevedore python-requests python-dateutil)
makedepends=(python-distribute)
conflicts=(${pkgname}-git)
source=(http://pypi.python.org/packages/source/g/guessit/guessit-${pkgver}.tar.gz)
md5sums=('11e658f9b0473d61d681579c03c196c3')

package() {
    cd "${srcdir}/guessit-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
