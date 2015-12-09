# Maintainer: renek <aur@spaceshore.net>
_pkgname=aiosasl
pkgname=python-${_pkgname}
pkgver=0.1.1
pkgrel=1
pkgdesc="A pure python generic asyncio SASL library"
arch=('any')
url="https://github.com/horazont/aiosasl"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/horazont/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('04caf45970c50150ac64a6988c59feaf9503babd964fa5bfd7ce72cd300787f758942886472b960aa26fb50a7e49990a20b0d5e5090a5d3e2862bd056de101ea')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
