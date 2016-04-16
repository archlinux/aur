# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Maintainer: Janusz Lewandowski <lew21@xtreeme.org>
pkgname=('python-pydbus'
         'python2-pydbus')
_pkgname='pydbus'
pkgver='0.5.1'
pkgrel='1'
pkgdesc='Pythonic DBus library'
arch=('any')
url='https://github.com/LEW21/pydbus'
license=('LGPL')
makedepends=('python-setuptools'
             'python2-setuptools')
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('e054c81fd9eaa550c3b566fc4049b477')

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
