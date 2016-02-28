# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=('python-pydbus'
         'python2-pydbus')
_pkgname='pydbus'
pkgver='0.3'
pkgrel='1'
pkgdesc='Python client library for Heat'
arch=('any')
url='https://launchpad.net/python-heatclient'
license=('Apache')
makedepends=('python-setuptools'
             'python2-setuptools')
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('dc597cbc9a59353f55961e5834073cb8ab39fa3f2c13c6c2bfc7d254a29f7bf9')

package_python-pydbus()
{
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py \
        install \
            --root="${pkgdir}" \
            --optimize=1
}

package_python2-pydbus()
{
    cd "${srcdir}/pydbus-${pkgver}"
    python2 setup.py \
        install \
            --root="${pkgdir}" \
            --optimize=1
}
