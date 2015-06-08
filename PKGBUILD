# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=psp-oslib
pkgver=1.1.2
pkgrel=1
pkgdesc="OldSchool Library (psp)"
arch=(any)
url="https://github.com/dogo/oslibmodv2"
license=('GPL3')
groups=('psp')
depends=('psp-sdk' 'psp-libjpeg' 'psp-libpng')
makedepends=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/dogo/oslibmodv2.git")
md5sums=('SKIP')

prepare()
{
  cd "$srcdir"/oslibmodv2
}

build()
{
  cd "$srcdir/oslibmodv2"
  make
}

package()
{
  cd "$srcdir/oslibmodv2"
  make install DESTDIR="$pkgdir"
}

