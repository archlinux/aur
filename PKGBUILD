# Maintainer: Jian Zeng <anonymousknight96 at gmail dot com>

pkgname=python-telegram-send
_name=telegram-send
pkgver=0.8.4
pkgrel=1
pkgdesc="Send messages and files over Telegram from the command-line."
arch=(any)
url='https://github.com/rahiel/telegram-send'
license=('GPLv3')
makedepends=('python-pip')
source=("https://pypi.python.org/packages/2d/6f/3080be3b230d3b949e790126d4f557869e7aa1bcaed5c0af87ec0484a498/telegram-send-$pkgver.tar.gz")
md5sums=('8bb6dd91973304dba5b169f191e4eb56')

package() {
   cd "$srcdir/$_name-$pkgver"
   python setup.py install --root="$pkgdir/" -O1
}
