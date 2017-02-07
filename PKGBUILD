# Maintainer: mdraw.gh at gmail dot com

pkgname='python-markovify'
pkgver='0.5.4'
pkgrel=1
pkgdesc="A simple, extensible Markov chain generator."
arch=('any')
url='https://github.com/borntyping/python-markovify'
license=('MIT')
depends=('python' 'python-unidecode')
makedepends=('python-setuptools')
source=("https://github.com/jsvine/markovify/archive/v${pkgver}.tar.gz")
md5sums=('3221cbe3bcac563609e974021ad8ab67')

package() {
    cd "${srcdir}/markovify-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

