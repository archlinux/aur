# Maintainer: Chase Franklin <jakhead at gmail dot com>
pkgname=packy
pkgver=0.1.1
pkgrel=1
pkgdesc="pacman updates for conky via rss"
arch=('any')
url="https://github.com/gnullbyte/packy"
license=('GPL')
depends=('expac' 'python-feedparser' 'python-xdg')
options=(!emptydirs)
source=("https://github.com/gnullbyte/$pkgname/tarball/$pkgver")
md5sums=("82c2e1fbab21101465d7162e4a52255c")

package() {
	cd "$srcdir/gnullByte-$pkgname-0979fb1"
	python setup.py install --prefix=/usr --root=$pkgdir --optimize=1
}


