# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=prepare_gnat_util
pkgver=6.1.1
pkgrel=1
pkgdesc="Provides libgnat-6.1.so & libgnarl-6.1.so required by gnat_util."

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
  ln -s  /usr/lib/libgnat-6.so   $pkgdir/usr/lib/libgnat-6.1.so
  ln -s  /usr/lib/libgnarl-6.so  $pkgdir/usr/lib/libgnarl-6.1.so
}


