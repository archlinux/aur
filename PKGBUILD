# Contributor: Doron Behar <doron.behar@gmail.com>
# Maintainer: hexchain <i@hexchain.org>

pkgname=compiledb
pkgver=0.10.0
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
sha256sums=('2950eb6e6fa425a92a92cb79e1489cf94c1aff6fb39b1ff5f8ce1467039b9771')
