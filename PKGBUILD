# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=('python-pydbus'
         'python2-pydbus')
_pkgname='pydbus'
pkgver='0.6.0'
pkgrel='1'
pkgdesc='Pythonic DBus library'
arch=('any')
url='https://github.com/LEW21/pydbus'
license=('LGPL')
makedepends=('python-setuptools'
             'python2-setuptools')
source=("https://pypi.python.org/packages/58/56/3e84f2c1f2e39b9ea132460183f123af41e3b9c8befe222a35636baa6a5a/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('4207162eff54223822c185da06c1ba8a34137a9602f3da5a528eedf3f78d0f2c')

package_python-pydbus()
{
    depends=('python'
             'python-gobject')
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py \
        install \
            --root="${pkgdir}" \
            --optimize=1
}

package_python2-pydbus()
{
    depends=('python2'
             'python2-gobject')
    cd "${srcdir}/pydbus-${pkgver}"
    python2 setup.py \
        install \
            --root="${pkgdir}" \
            --optimize=1
}
