# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-parglare
pkgver=0.9.2
pkgrel=1
pkgdesc="A pure Python scannerless LR/GLR parser"
arch=('any')
url="https://github.com/igordejanovic/parglare"
license=('MIT')
depends=('python' 'python-click')
options=(!emptydirs)
source=("https://github.com/igordejanovic/parglare/archive/${pkgver}.tar.gz")
sha384sums=('37612cd65028a2d666e0ca39f5c5619d8664041a7777ba8fc585de918992eb4189a556b0ac215012303c866d2c740a2e')

package() {
    cd "$srcdir/parglare-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
