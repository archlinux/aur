# Maintainer: Sterophonick

pkgname=unlz-gba
_pkgname='unlz-gba'
pkgver=1.0Beta
pkgrel=1
pkgdesc='Scan GBA ROMs for LZ77 compressed graphics'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
source=(https://s3-external-1.amazonaws.com/romhacking-hacks/utilities/%5B362%5Dunlz-gba.zip
        unlz-gba
        unlz-gba.desktop
        unlz-gba.png)
md5sums=('249eee2bbfba42d0dc71beb50f117520'
         'SKIP'
         'SKIP'
         'SKIP')


package() {
  cd $srcdir
  install -Dm755 unlz-gba $pkgdir/usr/bin/unlz-gba
  install -Dm644 unlz-gba.desktop $pkgdir/usr/share/applications/unlz-gba.desktop
  install -Dm644 unlz-gba.png $pkgdir/usr/share/pixmaps/unlz-gba.png
  
  mkdir -p $pkgdir/usr/share/unlz-gba

  install -Dm644 unLZ-GBA.exe $pkgdir/usr/share/unlz-gba
  install -Dm644 readme.txt $pkgdir/usr/share/unlz-gba
}
