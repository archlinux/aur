# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python
_distname=pkginfo
pkgname=${_python}-${_distname}
pkgver=1.2.1
pkgrel=1
pkgdesc="Query metadatdata from sdists / bdists / installed packages"
arch=('any')
url="http://pythonhosted.org/pkginfo"
license=('Python')
depends=("${_python}")
makedepends=("${_python}-setuptools")
source=("http://pypi.python.org/packages/source/${_distname:0:1}/${_distname}/${_distname}-${pkgver}.tar.gz")
sha256sums=('ad3f6dfe8a831f96a7b56a588ca874137ca102cc6b79fc9b0a1c3b7ab7320f3c')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1
}
