# Maintainer: Joost Bremmer <toost dot b at gmail dot com>

pkgname=mackup
pkgver=0.8.18
pkgrel=2
pkgdesc="a small Python utitlity to keep your application settings in sync."
arch=('any')
url="https://github.com/lra/mackup"
license=('GPL3')
depends=('python'
         'python-docopt')

makedepends=(
            'python'
            'python-setuptools')

source=("https://github.com/lra/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b4cbc729213717e5343371c682e098518fbd0be2209366a7f1b22c9ba6d1afa4')


package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim: set ts=2 sts=2 sw=2 et:
