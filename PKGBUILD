pkgbase=('python2-glob2')
pkgname=('python2-glob2')
_module='glob2'
pkgver='0.4.1'
pkgrel=1
pkgdesc="Version of the glob module that can capture patterns and supports recursive wildcards"
url="http://github.com/miracle2k/python-glob2/"
depends=('python2')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/g/glob2/glob2-${pkgver}.tar.gz")
md5sums=('0a4f0030d202dc0a21d64946f6fd5f5d')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
