# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=python-telegram-bot
pkgver=6.0.1
pkgrel=1
pkgdesc="A Python wrapper around the Telegram Bot API"
url="https://github.com/python-telegram-bot/python-telegram-bot"
depends=('python' 'python-future' 'python-certifi' 'python-urllib3' 'python-setuptools')
makedepends=('python3' )
license=('LGPLv3')
arch=('any')
source=("https://pypi.python.org/packages/b3/86/0ce63db69006343f3b5f1cc90cf6fee2fc0d1ddf21949bd591daefedeff7/${pkgname}-${pkgver}.tar.gz#md5=e6eb6d7e71a658415ebd8885f99d0945")
md5sums=("e6eb6d7e71a658415ebd8885f99d0945")

build() {
    cd $srcdir/python-telegram-bot-$pkgver
    python setup.py build
}
 
package() {
    cd $srcdir/python-telegram-bot-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
