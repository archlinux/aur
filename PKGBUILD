# Maintainer: Sterophonick

pkgname=gbata
_pkgname='gbata'
pkgver=0.7
pkgrel=1
pkgdesc='Game Boy Advance ROM viewer and patcher'
url='http://gbadat.altervista.org'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
source=(https://s3-external-1.amazonaws.com/romhacking-hacks/utilities/%5B601%5Dgbata7a-en.zip
        gbata
        gbata.desktop
        gbata.png)
md5sums=('e59501521166ffe4568fbb8fee59357f'
         'SKIP'
         'SKIP'
         'SKIP')


package() {
  cd $srcdir
  install -Dm755 gbata $pkgdir/usr/bin/gbata
  install -Dm644 gbata.desktop $pkgdir/usr/share/applications/gbata.desktop
  install -Dm644 gbata.png $pkgdir/usr/share/pixmaps/gbata.png
  
  mkdir -p $pkgdir/usr/share/gbata

  install -Dm644 gbata.exe $pkgdir/usr/share/gbata
  install -Dm644 readme.txt $pkgdir/usr/share/gbata
}
