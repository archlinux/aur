
# Maintainer: andybrookestar <andybrookestar[at]gmail[dot]com>


pkgname="fetchmirrorsgui"
pkgver=1.3
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

sha256sums=('83ae1a9d5d0f201d93bd800421d5250be4193e34b423367a59c510499ce4de32')
