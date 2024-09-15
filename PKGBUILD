# Maintainer: Sterophonick
pkgname=gba-mus-ripper
_pkgname='gba-mus-ripper'
pkgver=v3.3
pkgrel=1
pkgdesc='Suite of tools to rip music from GBA games that use MP2K.'
url='https://github.com/CaptainSwag101/gba-mus-ripper'
arch=(x86_64 i686 aarch64)
makedepends=(base-devel)
source=(git+https://github.com/CaptainSwag101/gba-mus-ripper)
md5sums=('SKIP')
license=('gplv3')

package() {
  cd $srcdir/gba-mus-ripper
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/gba-mus-ripper
  make
  cp out/* $pkgdir/usr/bin
  cp readme.txt $pkgdir/usr/share/doc/gba-mus-ripper
}
