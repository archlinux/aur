# Maintainer: Philip Goto <philip.goto@gmail.com>
_pkgname=aiotg
pkgname=python-$_pkgname
pkgver=0.9.8
pkgrel=1
pkgdesc="Asynchronous Python API for building Telegram bots"
url="https://github.com/szastupov/aiotg"
depends=('python-aiohttp' 'python-watchdog')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/6b/13/c853c337dc762070350ca8b6ecd140a089936cf12c069407de6f344a417f/aiotg-0.9.8.tar.gz")
md5sums=('8ad75023377dd472cc2221eaa39faaca')

build(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
