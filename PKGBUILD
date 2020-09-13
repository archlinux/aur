# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='kahlo'
pkgver='0.0.1'
pkgrel='1'
pkgdesc='RSS-based YouTube subscription download tool'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('python>=3.8.0' 'youtube-dl>=2020.07.28')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('37da3d1ab9e17f5f140dc47b07aa1fc6250fbdbfec5b883d236dec45a42ccc60')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
