# Maintainer and Contributor: Vladimir Kamensky  <mastersoft24@yandex.ru>


pkgname=winregfs-git
pkgver=0.6.2
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

md5sums=("feaf0e3cbd982568606ca8f7f92d0c8d")


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
