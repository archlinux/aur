# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname='cpy'
pkgver=0.1.0
pkgrel=1
pkgdesc="A replacement for [c]at with automatic syntax highlighting"
arch=('any')
url="https://github.com/rumpelsepp/c.py"
license=('MIT')
depends=('python' 'python-click' 'python-docopt' 'python-pygments')
makedepends=('git')
source=("$pkgname::git+https://github.com/rumpelsepp/c.py.git#commit=f53697549857fdb9fcf0df5761a36eca1f3441be")
sha256sums=('SKIP')


package() {
    cd "${srcdir}/${pkgname}"

    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
