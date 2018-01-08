# Maintainer and Contributor: Vladimir Kamensky  <mastersoft24@yandex.ru>


pkgname=winregfs-git
pkgver=0.7
pkgrel=3
pkgdesc="Windows Registry FUSE filesystem "
arch=('i686' 'x86_64')
url="https://github.com/jbruchon/winregfs"
license=('GPL')
categories=('utility')

depends=()

makedepends=('make'  )
options=(!emptydirs)

source=("https://github.com/jbruchon/winregfs/archive/master.zip")

md5sums=("485e7426f828c7b383773d9d37e4dd1f")


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
