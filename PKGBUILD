pkgname=python-telegram-bot
pkgver=4.3.3
pkgrel=1
pkgdesc="A Python wrapper around the Telegram Bot API"
url="https://github.com/python-telegram-bot/python-telegram-bot"
depends=('python' 'python-future' 'python-certifi')
makedepends=('python3' )
license=('LGPLv3')
arch=('any')
source=('https://pypi.python.org/packages/4e/df/e1bf23d2ac29dbe2a33a8444ad75faa3008091a6848f952073c07be88f32/python-telegram-bot-4.3.3.tar.gz#md5=98f29fe905567f873763b422f931b2a0')
md5sums=('98f29fe905567f873763b422f931b2a0')
 
build() {
    cd $srcdir/python-telegram-bot-4.3.3
    python setup.py build
}
 
package() {
    cd $srcdir/python-telegram-bot-4.3.3
    python setup.py install --root="$pkgdir" --optimize=1 
}
