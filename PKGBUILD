pkgname='python2-mutagen'
_module='mutagen'
pkgver='1.31'
pkgrel=1
pkgdesc="read and write audio tags for many formats"
url="https://bitbucket.org/lazka/mutagen"
depends=('python2')
makedepends=('python2-setuptools')
license=('GPL')
arch=('any')
source=("https://pypi.python.org/packages/source/m/mutagen/mutagen-${pkgver}.tar.gz")
md5sums=('6db58c5b58d85ffb15d208f46a372c01')

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
