
# Maintainer: Jeroen Rijken <jeroen dot rijken at gmail dot com>
# Contributor: Jeroen Rijken <jeroen dot rijken at gmail dot com>

pkgname=archi
pkgver=3.3.0
pkgrel=1
pkgdesc="Free, open source, cross-platform tool and editor to create ArchiMate models."
arch=('i686' 'x86_64')
url="http://www.archimatetool.com/"
license=('MIT')
depends=('java-runtime>=1.7' 'webkitgtk')
provides=('archi')
source=(http://www.archimatetool.com/downloads/latest/Archi-lnx32_64-$pkgver.tar.gz $pkgname.desktop)
sha256sums=('025d92acc377fa6d9a4285aceeb595803527755b3fb27a9a1f899b143fb816a8'
            'fa911232f47b9116044b6129965376c8c8acc9fc8bb212c5a2b4b834f03adb7c')

package() {
  cd $srcdir
  install -d -m755 $pkgdir/{opt/,/usr/{,share/{pixmaps,applications,licenses/$pkgname,doc/$pkgname}}}
  
  install -m644 $srcdir/Archi/docs/* $pkgdir/usr/share/doc/$pkgname/
  install -m644 $srcdir/Archi/README $pkgdir/usr/share/doc/$pkgname/
  install -m644 $srcdir/Archi/docs/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENCE
  install -m644 $srcdir/Archi/icon.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
  install -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  
  rm -R $srcdir/Archi/docs
  rm $srcdir/Archi/icon.xpm $srcdir/Archi/README $srcdir/Archi/Archi-Ubuntu.sh
  cp -R $srcdir/Archi/ $pkgdir/opt/$pkgname
  
  if test "$CARCH" == x86_64; then
    rm $pkgdir/opt/$pkgname/Archi32 $pkgdir/opt/$pkgname/Archi32.ini
    chmod 755 $pkgdir/opt/$pkgname/Archi64
    sed -i s/archiNAME/Archi64/g $pkgdir/usr/share/applications/$pkgname.desktop
  else
    rm $pkgdir/opt/$pkgname/Archi64 $pkgdir/opt/$pkgname/Archi64.ini
    chmod 755 $pkgdir/opt/$pkgname/Archi32
    sed -i s/archiNAME/Archi32/g $pkgdir/usr/share/applications/$pkgname.desktop
  fi
  
}

