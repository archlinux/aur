# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Gregoire Seux <grego_aur@familleseux.net>

pkgbase='python-astral'
pkgname=('python-astral' 'python2-astral')
_name='astral'
pkgver=1.6.1
pkgrel=1
pkgdesc="Calculations for the position of the sun and moon."
url="https://github.com/sffjunkie/astral"
makedepends=('python-setuptools' 'python2-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ab0c08f2467d35fcaeb7bad15274743d3ac1ad18b5391f64a0058a9cd192d37d')

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
