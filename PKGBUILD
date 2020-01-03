# Maintainer: xpt <user.xpt@gmail.com>
pkgname=python2-telegrambot-api
_name=pyTelegramBotAPI
pkgver=3.6.6
pkgrel=2
pkgdesc="Python Telegram bot api"
arch=('any')
url='https://github.com/eternnoir/pyTelegramBotAPI'
license=('GPL2')
depends=('python2' 'python2-pytest' 'python2-requests' 'python2-six')

source=("https://github.com/eternnoir/$_name/archive/$pkgver.tar.gz")
md5sums=('9b50a2d4fbd074c7928e70bb7748cef9') 

package() {
	cd "$srcdir/$_name-$pkgver"
	python2 setup.py install --root="$pkgdir/" 

	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


