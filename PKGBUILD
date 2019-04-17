# Maintainer: mdraw.gh at gmail dot com

pkgname='python-markovify'
pkgver='0.7.1'
pkgrel=1
pkgdesc="A simple, extensible Markov chain generator."
arch=('any')
url='https://github.com/jsvine/markovify'
license=('MIT')
depends=('python' 'python-unidecode')
makedepends=('python-setuptools')
source=("https://github.com/jsvine/markovify/archive/v${pkgver}.tar.gz")
sha256sums=('230ad17627dc1adb9b867895e6669894f190eac36961546e8ed0ebe2c9c46beb')

package() {
    cd "${srcdir}/markovify-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

