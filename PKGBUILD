# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-ufolib2')
_pkgname='ufoLib2'
pkgver='0.5.0'
pkgrel=1
pkgdesc="A UFO font library."
url="https://github.com/fonttols/ufoLib2"
checkdepends=('python-pytest')
depends=('python' 'python-fonttools' 'python-attrs')
makedepends=('python-setuptools')
optdepends=()
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('f914d6618c627503df66d70a274b1245aead49382d8bd6fbf3416c5c199c2b1f')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

#check() {
    #cd "$srcdir/$_pkgname-${pkgver}"
    #PYTHONPATH=src pytest tests
#}
