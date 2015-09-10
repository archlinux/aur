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
md5sums=("85b907112033d08151d021788df62484")

package() {
	cd "$srcdir/gnullByte-$pkgname-e782eff"
	python setup.py install --prefix=/usr --root=$pkgdir --optimize=1
}



