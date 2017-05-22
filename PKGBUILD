# Maintainer: Sean Enck <enckse@gmail.com>
# Maintainer: Sherlock Holo <sherlockya(at)gmail.com>
pkgname=python-telegram-bot
pkgver=6.0.1
pkgrel=3
pkgdesc="A Python wrapper around the Telegram Bot API"
url="https://github.com/python-telegram-bot/python-telegram-bot"
depends=('python' 'python-future' 'python-certifi' 'python-setuptools')
license=('LGPLv3')
arch=('any')
source=("https://pypi.python.org/packages/74/60/93967d945b6f4310086433bb3f632311a91fff93957ce5f059ff9736142a/python-telegram-bot-6.1b0.tar.gz")
md5sums=('1247a2b5238280ad6cc228125e326122')

prepare(){
    cd $srcdir
    bsdtar -xf $pkgname-6.1b0.tar.gz
}

package() {
    cd $srcdir/$pkgname-6.1b0
    python setup.py install --root="$pkgdir" --optimize=1 
}
