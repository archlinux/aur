# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>

pkgname=mackup
pkgver=0.8.23
pkgrel=1
pkgdesc="a small Python utitlity to keep your application settings in sync."
arch=('any')
url="https://github.com/lra/mackup"
license=('GPL3')
depends=('python'
         'python-docopt')

makedepends=('python'
             'python-setuptools')

source=("https://github.com/lra/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('40dbe6e645c67ef91d094a8d2c74bd5c0d1c15931061503c57e4a8216ba50d14')


package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim: set ts=2 sts=2 sw=2 et:
