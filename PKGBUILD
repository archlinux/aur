# Maintainer: Andrew Kiss <ubervoltage@gmail.com>
pkgname=morsetran
pkgver=1.1
pkgrel=3
url="https://github.com/supervoltage/$pkgname"
pkgdesc="ASCII morse code translator"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL')
groups=('libstdc++')
makedepends=('make')
options=()
source=("https://github.com/supervoltage/morsetran/archive/master.zip")
noextract=()
md5sums=('2d6d98ef6d6c211c38e95013ac645050')

build() {
	cd $srcdir/$pkgname-master
	
	make
}

package() {
	cd $srcdir/$pkgname-master
	
	install -m755 $srcdir/$pkgname-master/$pkgname /usr/bin/morsetran
}
