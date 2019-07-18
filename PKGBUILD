# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Gregoire Seux <grego_aur@familleseux.net>

pkgname=python2-astral
_name='astral'
pkgver=1.10.1
pkgrel=1
pkgdesc="Calculations for the position of the sun and moon."
url="https://github.com/sffjunkie/astral"
depends=('python2-pytz')
optdepends=('python2-requests: for Google geocoding support')
makedepends=('python2-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d2a67243c4503131c856cafb1b1276de52a86e5b8a1d507b7e08bee51cb67bf1')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
