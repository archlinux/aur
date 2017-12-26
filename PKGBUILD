# Maintainer: Philip Goto <philip.goto@gmail.com>
_pkgname=aiotg
pkgname=python-$_pkgname
pkgver=0.9.5
pkgrel=1
pkgdesc="Asynchronous Python API for building Telegram bots"
url="https://github.com/szastupov/aiotg"
depends=('python-aiohttp' 'python-watchdog')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/55/52/c594d96aa19c1222c9f10daacca48810fc9953a50643e3c2ae66679684c0/aiotg-0.9.5.tar.gz")
md5sums=('7a3203b982f455ec054a27d6390c132b')

build(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
