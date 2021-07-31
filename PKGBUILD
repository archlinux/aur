# Maintaner: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-aiohttp-oauthlib
_pkgname=aiohttp-oauthlib
pkgver=0.1.0
pkgrel=1
pkgdesc="oauthlib for aiohttp clients."
url="https://git.sr.ht/~whynothugo/aiohttp-oauthlib"
depends=('python-aiohttp' 'python-oauthlib')
makedepends=('python-pip')
license=("ISC")
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('992e8ca1c72a410c65aadcdd459f7144')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
