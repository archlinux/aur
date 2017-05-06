# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=python-telegram-bot
pkgver=5.3.1
pkgrel=1
pkgdesc="A Python wrapper around the Telegram Bot API"
url="https://github.com/python-telegram-bot/python-telegram-bot"
depends=('python' 'python-future' 'python-certifi' 'python-urllib3' 'python-setuptools')
makedepends=('python3' )
license=('LGPLv3')
arch=('any')
source=("https://pypi.python.org/packages/7a/4f/57cf78e2b00474999f519ebc018e6be629a97d50d4035cff7d6a8150552d/${pkgname}-${pkgver}.tar.gz#md5=e93a184b63a7aecb269aa84d5744a945")
md5sums=('e93a184b63a7aecb269aa84d5744a945')

build() {
    cd $srcdir/python-telegram-bot-$pkgver
    python setup.py build
}
 
package() {
    cd $srcdir/python-telegram-bot-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
