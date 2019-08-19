# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-fontmake')
_pkgname='fontmake'
pkgver='1.10.1'
pkgrel=1
pkgdesc="Compile fonts from sources (UFO, Glyphs) to binary (OpenType, TrueType)."
url="https://github.com/googlefonts/fontmake"
checkdepends=('python-cu2qu' 'python-pytest' 'python-pyclipper' 'python-ufonormalizer' 'python-ufo2ft' 'python-xmldiff')
depends=('python' 'python-defcon' 'python-fonttools' 'python-mutatormath')
makedepends=('python-setuptools')
optdepends=('python-ufonormalizer')
license=('Apache')
arch=('any')
#source=("https://github.com/googlefonts/fontmake/archive/v${pkgver}b1.tar.gz")
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('b2c35066699d71afbc766631c2310e0f17f22aa2f56ebc702f355731c8ce6eeb')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

#check() {
    #cd "$srcdir/$_pkgname-${pkgver}"
    #python setup.py test
#}
