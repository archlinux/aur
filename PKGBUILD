# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Submitter: Simon Zack <simonzack@gmail.com>
# Contributor: Santi Villalba <sdvillal@gmail.com>

pkgname=python-guessit
pkgver=3.0.0
pkgrel=1
pkgdesc="A library for guessing information from video files."
arch=(any)
url="http://pypi.python.org/pypi/guessit"
license=(LGPL)
depends=(python python-babelfish python-dateutil python-rebulk)
conflicts=(${pkgname}-git)
source=(https://github.com/guessit-io/guessit/archive/${pkgver}.tar.gz)
sha256sums=('12a2a24b055bcc9dd4c97beb1d83023cc649f65e01e897a59282167248ba320a')

package() {
    cd "${srcdir}/guessit-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
