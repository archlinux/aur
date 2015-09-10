# Maintainer: Chase Franklin <jakhead at gmail dot com>
pkgname=packy
pkgver=0.1.2
pkgrel=1
pkgdesc="pacman updates for conky via rss"
arch=('any')
url="https://github.com/gnullbyte/packy"
license=('GPL')
depends=('expac' 'python-feedparser' 'python-xdg')
options=(!emptydirs)
source=("https://github.com/gnullbyte/$pkgname/tarball/$pkgver")
md5sums=("6bd888192ac5ed67b760df46af4b9f35")

package() {
	cd "$srcdir/gnullByte-$pkgname-eaf6caa"
	python setup.py install --prefix=/usr --root=$pkgdir --optimize=1
}



