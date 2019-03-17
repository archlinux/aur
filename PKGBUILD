# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-aiotg
pkgver=1.0.0
pkgrel=1
pkgdesc="Asynchronous Python API for building Telegram bots"
url="https://github.com/szastupov/aiotg"
depends=('python-aiohttp' 'python-watchdog')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/25/5b/a62450bc695881b6e7963b4f9efcaaa5677c098b62d0db59f94ad91e614e/aiotg-1.0.0.tar.gz")
sha256sums=('ab46c1ea719c13e0a998c21558351e16a20176618bc24358f69096cafd918a2b')

build(){
    cd $srcdir/aiotg-$pkgver
    python setup.py build
}

package(){
    cd $srcdir/aiotg-$pkgver
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
