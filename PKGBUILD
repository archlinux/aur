# Maintainer: namor <roman.zm98@gmail.com>

pkgname=plank-theme-namor
pkgver=0.1
pkgrel=1
arch=('any')
url='https://github.com/roman-zm/plank-theme-namor'
license=('GPL3')
depends=('plank')
source=("git://github.com/roman-zm/$pkgname.git")
sha256sums=('SKIP')

build() {
	true
}

package() {
	cd $srcdir/$pkgname
	mkdir -p $pkgdir/usr/share/plank/themes/namor
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/namor/
}
