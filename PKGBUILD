# Maintainer: Popolon <popolon@popolon.org>

pkgname=python-pyguetzli
pkgver=1.0.9
pkgrel=1
pkgdesc="Python binding for Google’s Guetzli library"
arch=('any')
url="https://github.com/wanadev/pyguetzli"
license=('Apaache-2.0')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/wanadev/pyguetzli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('83c65f36e346aea55b689318abca2d89e51415d739ba2681d2b667f6d61e631f')

package() {
    cd "$srcdir/pyguetzli-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
