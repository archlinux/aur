# Maintainer: E5ten

pkgname=yadshot
pkgver=0.2.03
pkgrel=2
pkgdesc="GUI frontend for taking screenshots. Also uploads screenshots, files and pastes."
arch=('x86_64')
url='http://www.simonizor.net'
license=('GPL')
install=yadshot.install
depends=('slop' 'yad' 'xclip' 'curl')
optdepends=('ffmpeg: screenshot backend'
			'imagemagick: screenshot backend'
			'grabc: alternative colour picker')
source=("https://github.com/simoniz0r/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('b63d7947e343c5511a1219bb16bedc5a')

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
