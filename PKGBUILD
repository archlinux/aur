# Maintainer: Michael Duell <dev _at_ akurei _._ me>
# Contributor: Jian Zeng <anonymousknight96 at gmail dot com>

pkgname=python-telegram-send
_name=telegram-send
pkgver=0.34
pkgrel=1
pkgdesc="Send messages and files over Telegram from the command-line."
arch=(any)
url='https://github.com/rahiel/telegram-send'
license=('GPLv3')
makedepends=('python-setuptools')
depends=('python-telegram-bot' 'python-colorama' 'python-appdirs' 'python-cryptography')
source=("https://files.pythonhosted.org/packages/92/8c/0ef8546d52cfc5bfb942033cb8e1064cf14e6b1c754196229cda5ecaf8a4/telegram-send-0.34.tar.gz")

package() {
   cd "$srcdir/$_name-$pkgver"
   python setup.py install --root="$pkgdir/" -O1
}
b2sums=('c0f7b5ec5e28c57e9b93627ea8cc6f62800b060ffe2725fa558bef71d2646e7b00900f30b5ab02b63b329bdb61622d46e0d3441e36d7676a5b8f5c9b73d813eb')
