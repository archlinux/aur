# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-sphinx_materialdesign_theme
pkgver=0.1.11
pkgrel=1
pkgdesc="Asynchronous Python API for building Telegram bots"
url="https://github.com/szastupov/aiotg"
depends=('python-sphinx')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/6e/c4/0794bb6fc0bfae83b4f4b34e0784bf1553972560f04eb0cb701a3c200e86/sphinx_materialdesign_theme-${pkgver}.tar.gz")
sha256sums=('6e9dae4c6e5ba23c0657a94c1cf65f64be9c8bc1594a6fb41815f7daa3326aa9')

build(){
    cd "$srcdir/sphinx_materialdesign_theme-${pkgver}"
    python setup.py build
}

package(){
    cd "$srcdir/sphinx_materialdesign_theme-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
