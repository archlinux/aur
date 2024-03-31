# Maintainer: Sterophonick
pkgname=vinesauce-rom-corruptor
_pkgname='vinesauce-rom-corruptor'
pkgver=1.2.2
pkgrel=1
pkgdesc='Change the bytes of any file by tweaking some simple settings.'
url='http://github.com/Rikerz/VRC'
arch=(x86_64 i686)
depends=('wine' 'wine-mono')
makedepends=(p7zip)
source=(http://github.com/Rikerz/VRC/raw/master/bin/Vinesauce%20ROM%20Corruptor%20v1.2.2.zip
        vinesauce-rom-corruptor
        vinesauce-rom-corruptor.desktop
        vinesauce-rom-corruptor.png)
noextract=($filename.zip)
md5sums=('7da85e9e590a18e1d205393eb6d11536'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
  cd $srcdir
  install -Dm755 vinesauce-rom-corruptor $pkgdir/usr/bin/vinesauce-rom-corruptor
  install -Dm644 vinesauce-rom-corruptor.desktop $pkgdir/usr/share/applications/vinesauce-rom-corruptor.desktop
  install -Dm644 vinesauce-rom-corruptor.png $pkgdir/usr/share/pixmaps/vinesauce-rom-corruptor.png
  
  mkdir -p $pkgdir/usr/share/vinesauce-rom-corruptor
  cp Vinesauce\ ROM\ Corruptor.exe $pkgdir/usr/share/vinesauce-rom-corruptor
}
