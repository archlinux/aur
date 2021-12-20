# Maintainer: Popolon <popolon@popolon.org>

pkgname=python-pyguetzli
pkgver=1.0.10
pkgrel=1
pkgdesc="Python binding for Google’s Guetzli library"
arch=('any')
url="https://github.com/wanadev/pyguetzli"
license=('Apache-2.0')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/wanadev/pyguetzli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('90af12898741e0c95f17be97bd0ca5387aa6ea6f9d5edf41fe29199b494912c4')

package() {
    cd "$srcdir/pyguetzli-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
