# Maintainer: Jian Zeng <anonymousknight96 at gmail dot com>

pkgname=python-telegram-send
_name=telegram-send
pkgver=0.18
pkgrel=1
pkgdesc="Send messages and files over Telegram from the command-line."
arch=(any)
url='https://github.com/rahiel/telegram-send'
license=('GPLv3')
makedepends=('python-setuptools')
depends=('python-telegram-bot' 'python-colorama' 'python-appdirs')
source=("https://pypi.python.org/packages/93/ad/87a023b2c6cd7457b336d9e1d0c85e2f2042df3a4e5e377ef72f61804085/telegram-send-0.18.tar.gz")
md5sums=('264dd89b9613df81ada405c7ab30e456')

package() {
   cd "$srcdir/$_name-$pkgver"
   python setup.py install --root="$pkgdir/" -O1
}
