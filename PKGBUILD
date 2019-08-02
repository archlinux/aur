# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>

pkgname=mackup
pkgver=0.8.26
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
sha256sums=('e74d8cfd235a70dea26f0f3fcf4f60a78313e51c1a01ae3edd2558bf5c62dd7a')


package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim: set ts=2 sts=2 sw=2 et:
