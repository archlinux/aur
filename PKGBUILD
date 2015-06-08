# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=psp-libbulletml
pkgver=0.0.5
pkgrel=1
pkgdesc="C++ library to handle BulletML easily (psp)"
arch=(any)
url="http://shinh.skr.jp/libbulletml/"
license=('BSD')
groups=('psp')
depends=('psp-sdk')
makedepends=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/psp-ports.git")
md5sums=('SKIP')

build()
{
  cd "$srcdir/psp-ports/libbulletml/src"
  make
}

package()
{
  cd "$srcdir/psp-ports/libbulletml/src"
  make install PSPDIR="$pkgdir"/usr/psp
}

