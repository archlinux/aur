# Maintainer: xpt <user.xpt@gmail.com>
pkgname=python2-telegrambot-api
_name=pyTelegramBotAPI
pkgver=1.4.2
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=(any)
url='https://github.com/eternnoir/pyTelegramBotAPI'
license=('GPL2')
depends=('python2' 'python2-pytest' 'python2-requests' 'python2-six')

source=("https://github.com/eternnoir/$_name/archive/$pkgver.$pkgrel.tar.gz")
md5sums=('6c42100fa178f09e4a9db5a618782054') 

package() {
	cd "$srcdir/$_name-$pkgver.$pkgrel"
	python2 setup.py install --root="$pkgdir/" 

	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


