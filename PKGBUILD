# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Gregoire Seux <grego_aur@familleseux.net>

pkgbase='python-astral'
pkgname=('python-astral' 'python2-astral')
_name='astral'
pkgver=1.7.1
pkgrel=1
pkgdesc="Calculations for the position of the sun and moon."
url="https://github.com/sffjunkie/astral"
makedepends=('python-setuptools' 'python2-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('88086fd2006c946567285286464b2da3294a3b0cbba4410b7008ec2458f82a07')

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
