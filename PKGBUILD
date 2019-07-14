# Contributor: Doron Behar <doron.behar@gmail.com>
# Maintainer: hexchain <i@hexchain.org>

pkgname=compiledb
pkgver=0.10.1
pkgrel=1
pkgdesc="Tool for generating Clang's JSON Compilation Database file for GNU make-based build systems"
arch=('any')
url="https://github.com/nickdiego/compiledb-generator"
license=('GPL3')
depends=('python' 'python-click' 'python-bashlex' 'python-shutilwhich')
replaces=(compiledb-generator)
source=("${url}/archive/v${pkgver}.tar.gz")

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
sha256sums=('3f288e4897e2b17b4dd8070d3ad9e9fc627961faa4d0be29a78f6c619e055f36')
