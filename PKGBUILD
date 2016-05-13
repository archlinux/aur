# Maintainer: xpt <user.xpt@gmail.com>
pkgname=python2-telegrambot-api
_name=pyTelegramBotAPI
pkgver=2.0.5
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=('any')
url='https://github.com/eternnoir/pyTelegramBotAPI'
license=('GPL2')
depends=('python2' 'python2-pytest' 'python2-requests' 'python2-six')

source=("https://github.com/eternnoir/$_name/archive/$pkgver.tar.gz")
md5sums=('3ef034c16564459a6ded27fa59f85da5') 

package() {
	cd "$srcdir/$_name-$pkgver"
	python2 setup.py install --root="$pkgdir/" 

	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


