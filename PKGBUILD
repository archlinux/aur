# Maintainer: Jesse Bryan <winneonsword@gmail.com>
pkgname=cappy
pkgver=1.0.3
pkgrel=1
epoch=
pkgdesc="A simple and reliable screenshot tool."
arch=('any')
url="https://github.com/Winneon/cappy"
license=('MIT')
depends=('curl'
         'xdotool'
         'xclip'
         'imagemagick')
source=("https://github.com/Winneon/cappy/archive/master.tar.gz")
md5sums=('0eb964600943816d1552a3cbeeaff6e8')


package(){
	cd "$srcdir/cappy-master"
	
	# install script
	mkdir -p "$pkgdir/usr/bin"
	install -m755 cappy "$pkgdir/usr/bin/cappy"
	
	# install MIT
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
