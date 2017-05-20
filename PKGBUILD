# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=python-telegram-bot
pkgver=6.0.0
pkgrel=1
pkgdesc="A Python wrapper around the Telegram Bot API"
url="https://github.com/python-telegram-bot/python-telegram-bot"
depends=('python' 'python-future' 'python-certifi' 'python-urllib3' 'python-setuptools')
makedepends=('python3' )
license=('LGPLv3')
arch=('any')
source=("https://pypi.python.org/packages/6f/7f/887a46bee86e16967f624479c4b7d7fd7c24765cada8f1c490ff5c9f6551/${pkgname}-${pkgver}.tar.gz#md5=5c0833a7d749ec3e20825e13e8d56cba")
md5sums=('5c0833a7d749ec3e20825e13e8d56cba')

build() {
    cd $srcdir/python-telegram-bot-$pkgver
    python setup.py build
}
 
package() {
    cd $srcdir/python-telegram-bot-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
