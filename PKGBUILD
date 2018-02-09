# Maintainer: Philip Goto <philip.goto@gmail.com>
_pkgname=aiotg
pkgname=python-$_pkgname
pkgver=0.9.7
pkgrel=1
pkgdesc="Asynchronous Python API for building Telegram bots"
url="https://github.com/szastupov/aiotg"
depends=('python-aiohttp' 'python-watchdog')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/39/90/51c087d0d772afbf92cb2e9daf1ff911a291bd622a09f964e5fb2e92daa4/aiotg-0.9.7.tar.gz")
md5sums=('376fdcc792078309226cb1301c16db8e')

build(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package(){
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
