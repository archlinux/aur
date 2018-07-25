# Maintainer: E5ten

pkgname=yadshot
pkgver=0.2.02
pkgrel=3
pkgdesc="A GUI frontend for taking screenshots using imagemagick/slop and uploads files and pastes to teknik.io "
arch=('x86_64')
url='http://www.simonizor.net'
license=('GPL')
install=yadshot.install
depends=('slop' 'yad' 'xclip' 'curl')
optdepends=('ffmpeg: screenshot backend'
			'imagemagick: screenshot backend'
			'grabc: alternative colour picker')
source=("https://github.com/simoniz0r/$pkgname/archive/$pkgver.tar.gz")
md5sums=('5bb6c657935ae286818f03898f6d69df')

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}
