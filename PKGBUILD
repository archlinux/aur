# Contributor: Realitygaps <realitygaps yahoo com>

pkgname=musagi
pkgver=18
pkgrel=1
pkgdesc='Multiplatform music composition software'
arch=(i686)
url=http://bitbucket.org/stqn/musagi-stqn
license=(custom)
depends=(portaudio sdl gtk2 libgl)
makedepends=(mercurial)

_hgroot=http://bitbucket.org/stqn/
_hgrepo=musagi-stqn

build() {
  cd $srcdir/$_hgrepo
}

package() {
  cd $srcdir/$_hgrepo
  make
  mkdir -p $pkgdir/opt/musagi
  cp $srcdir/$_hgrepo/musagi $pkgdir/opt/musagi/ 
  cp $srcdir/$_hgrepo/NEWS $pkgdir/opt/musagi/ 
  cp $srcdir/$_hgrepo/README $pkgdir/opt/musagi/ 
  cp $srcdir/$_hgrepo/license.txt $pkgdir/opt/musagi/ 
  cp -r $srcdir/$_hgrepo/documentation $pkgdir/opt/musagi/
  cp -r $srcdir/$_hgrepo/skins $pkgdir/opt/musagi/
  cp -r $srcdir/$_hgrepo/songs $pkgdir/opt/musagi/
  cp -r $srcdir/$_hgrepo/instruments $pkgdir/opt/musagi/
}
