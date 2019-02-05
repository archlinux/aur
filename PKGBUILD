# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Gregoire Seux <grego_aur@familleseux.net>

pkgbase='python-astral'
pkgname=('python-astral' 'python2-astral')
_name='astral'
pkgver=1.10
pkgrel=1
pkgdesc="Calculations for the position of the sun and moon."
url="https://github.com/sffjunkie/astral"
makedepends=('python-setuptools' 'python2-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8ef9e2346befb46867ccda69fe10b430dda13740b35e41016bfe5eec64d53e64')

package_python-astral() {
    depends=('python-requests' 'python-pytz')

    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-astral() {
    depends=('python2-requests' 'python2-pytz')

    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
