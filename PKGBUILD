pkgname=python-telegram-bot
pkgver=3.3b1
pkgrel=1
pkgdesc="A Python wrapper around the Telegram Bot API"
url="https://github.com/python-telegram-bot/python-telegram-bot"
depends=('python' 'python-future' )
makedepends=('python3' )
license=('LGPLv3')
arch=('any')
source=('https://pypi.python.org/packages/source/p/python-telegram-bot/python-telegram-bot-3.3b1.tar.gz')
md5sums=('5b69e0e7fa5916872d2a71c831598e83')
 
build() {
    cd $srcdir/python-telegram-bot-3.3b1
    python setup.py build
}
 
package() {
    cd $srcdir/python-telegram-bot-3.3b1
    python setup.py install --root="$pkgdir" --optimize=1 
}
