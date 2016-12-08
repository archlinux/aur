# Maintainer: Jaume Delclòs <jaume@delclos.com>
pkgname=neet
pkgver=1.0.7
pkgrel=1
pkgdesc="A script to easily play and manage your anime/drama/series"
arch=(any)
url="https://github.com/onodera-punpun/neet"
license=('GPL')
depends=(fish getopts)
optdepends=('mpv: default media player')
source=("https://github.com/onodera-punpun/neet/archive/1.0.7.tar.gz")
md5sums=('c83d45365c4d1cae0355aead8c14adbc')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
