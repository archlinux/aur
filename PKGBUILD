# Maintainer: sorrow
pkgname=python-pygradientify
pkgver=1.0.2
pkgrel=1
pkgdesc="Make terminal UI's beautiful"
arch=('any')
url="https://github.com/xsorroww/pygradientify"
license=('MIT')
depends=('python')
makedepends=('python-pip' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/p/pygradientify/pygradientify-${pkgver}.tar.gz")
sha256sums=('SKIP')  # optional, you can compute the real sha256

build() {
    return 0  # no build step needed, pip will handle it
}

package() {
    cd "$srcdir/pygradientify-${pkgver}"
    python -m pip install . --root="$pkgdir" --no-deps --ignore-installed
}