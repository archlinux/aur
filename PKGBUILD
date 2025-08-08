# Maintainer: Sterophonick

pkgname=cge7-bin
pkgver=0.24
pkgrel=1
pkgdesc='MZ-700 Character Graphics Editor'
url='http://www.maroon.dti.ne.jp/youkan/mz700/index.html'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
source=(http://www.maroon.dti.ne.jp/youkan/mz700/CGE7.zip
        mz700fon.dat
        cge7
        cge7.desktop
        cge7.png)
md5sums=('8f723fb0837d9f74a5e21bfbff8ea7b9'
         '5d4fa8ac653e0fa7a28bd10d2180bdc8'
         'SKIP'
         'SKIP'
         'SKIP')


package() {
  cd $srcdir
  install -Dm755 cge7 $pkgdir/usr/bin/cge7
  install -Dm644 cge7.desktop $pkgdir/usr/share/applications/cge7.desktop
  install -Dm644 cge7.png $pkgdir/usr/share/pixmaps/cge7.png
  
  mkdir -p $pkgdir/usr/share/cge7

  install -Dm644 CGE7.exe $pkgdir/usr/share/cge7/CGE7.exe
  install -Dm644 readme.txt $pkgdir/usr/share/cge7/readme.txt
  install -Dm644 mz700fon.dat $pkgdir/usr/share/cge7/mz700fon.dat
}
