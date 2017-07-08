pkgbase=('python-fuocore')
pkgname=('python-fuocore')
_module='fuocore'
pkgver='0.0.5a5'
pkgrel=1
pkgdesc="feeluown core"
url="https://github.com/cosven/feeluown-core"
depends=('python' 'mpv' 'python-beautifulsoup4' 'python-marshmallow' 'python-crypto' 'python-requests' 'python-april' 'python-aiozmq' 'python-msgpack' 'python-mutagen' 'python-levenshtein' 'python-fuzzywuzzy')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/f/fuocore/fuocore-${pkgver}.tar.gz")
md5sums=('3d37d5b382a04da64a0e4130c75f4bc2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
