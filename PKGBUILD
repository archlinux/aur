# Maintainer: Philip Goto <philip.goto@gmail.com>
_pkgname=aiotg
pkgname=python-$_pkgname
pkgver=0.9.4
pkgrel=1
pkgdesc="Asynchronous Python API for building Telegram bots"
url="https://github.com/szastupov/aiotg"
depends=('python-aiohttp' 'python-watchdog')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/55/21/7acdfaf7670925e2808e998629c83c63cd55f7a7eea85d45c4306fb92700/aiotg-0.9.4.tar.gz")
md5sums=('bb61da2f05840e2ed705e38e15e11f7a')

build(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
