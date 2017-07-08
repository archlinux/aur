# Maintainer: Jian Zeng <anonymousknight96 at gmail dot com>

pkgname=python-telegram-send
_name=telegram-send
pkgver=0.9.3
pkgrel=1
pkgdesc="Send messages and files over Telegram from the command-line."
arch=(any)
url='https://github.com/rahiel/telegram-send'
license=('GPLv3')
makedepends=('python-setuptools')
depends=('python-telegram-bot' 'python-colorama')
source=("https://pypi.python.org/packages/48/1c/274096c8e0ac37dae8e548f54188d8b246a9cc399dc79cfeddce9589a94c/$_name-$pkgver.tar.gz")
md5sums=('05b7dded3e9be2a59d76b5075d99fd97')

package() {
   cd "$srcdir/$_name-$pkgver"
   python setup.py install --root="$pkgdir/" -O1
}
