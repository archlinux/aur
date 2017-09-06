# Maintainer: Kyle Walker <kylejameswalker dot com>
# Contributor: tembleking <tembleking at gmail dot com>
pkgname=('python-telebot' 'python2-telebot')
pkgver=0.0.3
pkgrel=1
pkgdesc="A Telegram bot library, with simple route decorators."
arch=("any")
url="https://github.com/KyleJamesWalker/telebot"
license=('MIT')
makedepends=("python-setuptools" "python2-setuptools")
source=("https://github.com/KyleJamesWalker/telebot/archive/v$pkgver.tar.gz")


package_python-telebot() {
	depends=("python" "python-requests")
	cd "telebot-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-telebot() {
	depends=("python2" "python2-requests")
	cd "telebot-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}


md5sums=('c220c4c5305bd8ad959af02be96d9051')
