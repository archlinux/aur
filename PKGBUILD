# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=psp-libjpeg
pkgver=8c
pkgrel=1
pkgdesc="JPEG image codec (psp)"
arch=(any)
url="http://freetype.sourceforge.net"
license=('GPL')
groups=('psp')
depends=('psp-sdk')
makedepends=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/psp-ports.git")
md5sums=('SKIP')

build()
{
  cd "$srcdir/psp-ports/jpeg"
  make
}

package()
{
  cd "$srcdir/psp-ports/jpeg"
  make install PSPDIR="$pkgdir"/usr/psp
}

