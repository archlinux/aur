# Maintainer: E5ten

pkgname=yadshot
pkgver=0.1.95
pkgrel=1
pkgdesc="yadshot provides a GUI frontend for taking screenshots using imagemagick/slop and uploads files and pastes to teknik.io "
arch=('x86_64')
url='http://www.simonizor.net'
license=('GPL')
depends=('slop' 'imagemagick' 'yad' 'xclip' 'curl')
source=("https://github.com/simoniz0r/$pkgname/archive/$pkgver.tar.gz")
md5sums=('SKIP')

prepare() {
    cd $srcdir
    bsdtar xvf $pkgver.tar.gz
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}
