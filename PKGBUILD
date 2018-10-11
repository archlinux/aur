# Maintainer: Michael Duell <mail _at_ akurei _._ me>
# Contributor: Jian Zeng <anonymousknight96 at gmail dot com>

pkgname=python-telegram-send
_name=telegram-send
pkgver=0.20
pkgrel=1
pkgdesc="Send messages and files over Telegram from the command-line."
arch=(any)
url='https://github.com/rahiel/telegram-send'
license=('GPLv3')
makedepends=('python-setuptools')
depends=('python-telegram-bot' 'python-colorama' 'python-appdirs')
source=("https://files.pythonhosted.org/packages/88/04/218c71cab345b58c319109af1936ccedf5e0450f2c07faac405ccd111b2d/telegram-send-0.20.tar.gz")
sha256sums=('ce4372ed2809ab4a6521972322461cb72c1186d5d6cc91e983ffee84d14e10ea')

package() {
   cd "$srcdir/$_name-$pkgver"
   python setup.py install --root="$pkgdir/" -O1
}
