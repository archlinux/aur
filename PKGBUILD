# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>

pkgname=mackup
pkgver=0.8.19
pkgrel=1
pkgdesc="a small Python utitlity to keep your application settings in sync."
arch=('any')
url="https://github.com/lra/mackup"
license=('GPL3')
depends=('python')

makedepends=(
            'python'
            'python-docopt'
            'python-setuptools')

source=("https://github.com/lra/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('28c1318a716acd6e9b3ec6ccf5c8a0087dbeb8c46ccef78d1891479dd4ccf31a')


package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim: set ts=2 sts=2 sw=2 et:
