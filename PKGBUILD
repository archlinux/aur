# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=prepare_gnat_util
pkgver=1
pkgrel=1
pkgdesc="Provides libgnat-5.2.so required by gnat_util."

options=('!emptydirs')

arch=('i686' 'x86_64')
#url="http://sourceforge.net/projects/gnatutil"
license=('GPL V3.0 without any Runtime Exception')

depends=('gcc-ada')
makedepends=('binutils>=2.25' 'libmpc' 'gcc-ada')




build() 
{
  ls
}



package() 
{
  mkdir -p  $pkgdir/usr/lib
  ln -s  /usr/lib/libgnat-5.so  $pkgdir/usr/lib/libgnat-5.2.so
}


