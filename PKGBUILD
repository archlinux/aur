# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-parglare
pkgver=0.12.0
pkgrel=1
pkgdesc="A pure Python scannerless LR/GLR parser"
arch=('any')
url="https://github.com/igordejanovic/parglare"
license=('MIT')
depends=('python' 'python-click')
options=(!emptydirs)
source=("https://github.com/igordejanovic/parglare/archive/${pkgver}.tar.gz")
sha384sums=('37637cf5f3d99b2f7c77748cd2841bdd261e0192427fc8e0dd9b8e87337390e4f931b052667a4ae2a1fe54f18da5aade')

package() {
    cd "$srcdir/parglare-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
