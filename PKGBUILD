# Maintainer: Johannes Krattenmacher <aur.rx3fdytstz (at) krateng (dot) ch>
pkgname=flacco
pkgver=1.0
pkgrel=1
pkgdesc="Simple command line tool to convert, tag and name .wav files from cdparanoia"
arch=('x86_64')
url="https://github.com/krateng/flacco"
source=('https://raw.githubusercontent.com/krateng/flacco/master/flacco')
sha256sums=('15131130ffc2f5a60a194a661f1dc38a8fcdfb7ebf898bb224670fc6a516f8ff')
license=('GPL3')
depends=('flac' 'python')
optdepends=('ffmpeg: use wav files as input instead of converting first'
	'cdparanoia: use of flacco makes no sense without it')
	
	
package() {
	cd $srcdir
	mkdir -p "$pkgdir/usr/bin"
	install flacco "$pkgdir/usr/bin/flacco"
}
