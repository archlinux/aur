pkgname=python-telegram-bot
pkgver=5.0.0
pkgrel=1
pkgdesc="A Python wrapper around the Telegram Bot API"
url="https://github.com/python-telegram-bot/python-telegram-bot"
depends=('python' 'python-future' 'python-certifi' 'python-urllib3' 'python-setuptools')
makedepends=('python3' )
license=('LGPLv3')
arch=('any')
source=('https://pypi.python.org/packages/53/a6/fd03aee4929dc6376566c6d6c771f5b7c2f963da6066998ef74f706047d7/python-telegram-bot-5.0.0.tar.gz#md5=a6b88911010b90ff5681efac7d3f62ba')
md5sums=('a6b88911010b90ff5681efac7d3f62ba')
 
build() {
    cd $srcdir/python-telegram-bot-$pkgver
    python setup.py build
}
 
package() {
    cd $srcdir/python-telegram-bot-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
