
# Maintainer: andybrookestar <andybrookestar[at]gmail[dot]com>


pkgname="fetchmirrorsgui"
pkgver=1.2
pkgrel=1
pkgdesc="  standalone with gui populator for /etc/pacman.d/mirrorslist"
arch=("x86_64")
license=('MIT')
source=("https://notabug.org/captainsensible/$pkgname/archive/$pkgver.tar.gz")


package() {
  cd "$srcdir/$pkgname/dist"

  install -d $pkgdir/usr/bin
  

  install -Dm755 $pkgname         $pkgdir/usr/bin/$pkgname
 

}




sha256sums=('062b1a17d2330efcfdd51fbfb716d6d0e7a47432c4732f55996f2856fc820509')
