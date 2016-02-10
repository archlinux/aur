# Maintainer: Jesse Bryan <winneonsword@gmail.com>
pkgname=cappy
pkgver=1.0.6
pkgrel=1
epoch=
pkgdesc="A simple and reliable screenshot tool."
arch=('any')
url="https://github.com/Winneon/cappy"
license=('MIT')
depends=('curl'
         'xdotool'
         'xsel'
         'imagemagick'
         'rxvt-unicode'
         'wmctrl')
source=("https://github.com/Winneon/cappy/archive/master.tar.gz")
md5sums=('ca67a5dba03a2839905292d760aa0ba1')


package(){
	cd "$srcdir/cappy-master"
	
	# install script
	mkdir -p "$pkgdir/usr/bin"
	install -m755 cappy "$pkgdir/usr/bin/cappy"
	
	# install MIT
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
