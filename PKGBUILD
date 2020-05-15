# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: mdraw.gh at gmail dot com

pkgname='python-markovify'
pkgver='0.8.0'
pkgrel=1
pkgdesc="A simple, extensible Markov chain generator."
arch=('any')
url='https://github.com/jsvine/markovify'
license=('MIT')
depends=('python' 'python-unidecode')
makedepends=('python-setuptools')
source=("https://github.com/jsvine/markovify/archive/v${pkgver}.tar.gz")
sha256sums=('681cd1df643985098340861c9f8aa7da56a25e4bd2543c52c0696fa36d10b2de')

package() {
    cd "${srcdir}/markovify-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

