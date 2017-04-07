# Maintainer: mdraw.gh at gmail dot com

pkgname='python-markovify'
pkgver='0.6.0'
pkgrel=1
pkgdesc="A simple, extensible Markov chain generator."
arch=('any')
url='https://github.com/jsvine/python-markovify'
license=('MIT')
depends=('python' 'python-unidecode')
makedepends=('python-setuptools')
source=("https://github.com/jsvine/markovify/archive/v${pkgver}.tar.gz")
sha256sums=('7b0e88ded6e9b2aa0ab10d41bb45176aa81c3bbc37079e2b48403dd40484a240')

package() {
    cd "${srcdir}/markovify-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

