#Maintainer: osafi <omeed@safi.ms>
pkgname=dfiler
pkgver=0.1
pkgrel=2
pkgdesc="Quickly edit .desktop files to show/hide applications"
arch=(i686 x86_64)
url='https://bitbucket.org/osafi/dfiler'
license=('GPL')

source=(https://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz)
md5sums=('6cd0ffea3884a4e79330338dcc2987d6')

build(){
cd "hello-2.10"
./configure --prefix=/usr
make
}
package(){
cd "hello-2.10"
make DESTDIR="$pkgdir/" install
}
