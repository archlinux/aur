# Maintainer: Michael Duell <dev _at_ akurei _._ me>
# Contributor: Jian Zeng <anonymousknight96 at gmail dot com>

pkgname=python-telegram-send
_name=telegram-send
pkgver=0.25
pkgrel=2
pkgdesc="Send messages and files over Telegram from the command-line."
arch=(any)
url='https://github.com/rahiel/telegram-send'
license=('GPLv3')
makedepends=('python-setuptools')
depends=('python-telegram-bot' 'python-colorama' 'python-appdirs' 'python-cryptography')
source=("https://files.pythonhosted.org/packages/28/0f/012bb991fae8732d2847d3b90cb19f764944b4dc63daac00d529d6c9214f/telegram-send-0.25.tar.gz")

package() {
   cd "$srcdir/$_name-$pkgver"
   python setup.py install --root="$pkgdir/" -O1
}
sha384sums=('a2252de02c7c440ee06a45765d5663d01b4887b9b108138709960bb4c15faa9206c5944eff4d8179efb1e0380cbed965')
