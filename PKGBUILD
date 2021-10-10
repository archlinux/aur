
# Maintainer: andybrookestar <andybrookestar[at]gmail[dot]com>


pkgname="fetchmirrorsgui"
pkgver=1.4
pkgrel=1
pkgdesc="  standalone with gui populator for /etc/pacman.d/mirrorslist"
arch=("x86_64")
url="https://notabug.org/captainsensible/fetchMirrorsGui"
license=('MIT')
source=("https://notabug.org/captainsensible/$pkgname/archive/$pkgver.tar.gz")


package() {
  cd "$srcdir/$pkgname/dist"
  install -d $pkgdir/usr/bin
  install -Dm755 $pkgname         $pkgdir/usr/bin/$pkgname
 
}


sha256sums=('ab197fa0c660fdd074474537f6076835f2b57c7ef49b672c1a5ef422e2ec9cf7')
