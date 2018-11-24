# Maintainer: E5ten

pkgname=yadshot
pkgver=0.2.05
pkgrel=1
pkgdesc="GUI frontend for taking screenshots. Also uploads screenshots, files and pastes."
arch=('x86_64')
url='http://www.simonizor.net'
license=('GPL')
install=yadshot.install
depends=('slop' 'yad' 'xclip' 'curl')
optdepends=('ffmpeg: screenshot backend'
			'imagemagick: screenshot backend'
			'grabc: alternative colour picker')
source=("https://github.com/simoniz0r/$pkgname/archive/$pkgver.tar.gz")
md5sums=('336ed1ee2a2220c3390a47e01e7db7ee')

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
