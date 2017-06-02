# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=prepare_gnat_util
pkgver=7.1
pkgrel=1
pkgdesc="Provides libgnat-7.1.so & libgnarl-7.1.so required by gnat_util and other Ada packages."

options=('!emptydirs')

arch=('i686' 'x86_64')
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
  ln -s  /usr/lib/libgnat-7.so   $pkgdir/usr/lib/libgnat-7.1.so
  ln -s  /usr/lib/libgnarl-7.so  $pkgdir/usr/lib/libgnarl-7.1.so
}
