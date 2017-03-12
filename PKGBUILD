# Maintainer and Contributor: Vladimir Kamensky  <mastersoft24@yandex.ru>


pkgname=winregfs-git
pkgver=0.7
pkgrel=1
pkgdesc="Windows Registry FUSE filesystem "
arch=('i686' 'x86_64')
url="https://github.com/jbruchon/winregfs"
license=('GPL')
categories=('utility')

depends=()

makedepends=('make'  )
options=(!emptydirs)

source=("https://github.com/jbruchon/winregfs/archive/master.zip")

md5sums=("e5184c8aab0e610f5ab92d5c2ecfef87")


build() {
	cd "$srcdir/winregfs-master"
	
  
  

  rm -rf build
  mkdir build

 make 

}
 
package() {
	cd "$srcdir/winregfs-master"
	
	
	make DESTDIR="$pkgdir" install


}
