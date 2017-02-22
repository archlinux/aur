# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=python-telegram-bot
pkgver=5.3.0
pkgrel=1
pkgdesc="A Python wrapper around the Telegram Bot API"
url="https://github.com/python-telegram-bot/python-telegram-bot"
depends=('python' 'python-future' 'python-certifi' 'python-urllib3' 'python-setuptools')
makedepends=('python3' )
license=('LGPLv3')
arch=('any')
source=("https://pypi.python.org/packages/f0/60/c17a0dcbc9967faa46d93749822c7ceb71df2b58acdf6444f424869cf437/${pkgname}-${pkgver}.tar.gz#md5=708b0bef48e524f1474c3daa067a4780")
md5sums=('708b0bef48e524f1474c3daa067a4780')

build() {
    cd $srcdir/python-telegram-bot-$pkgver
    python setup.py build
}
 
package() {
    cd $srcdir/python-telegram-bot-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
