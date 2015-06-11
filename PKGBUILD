pkgname=otf-auretech
pkgver=1.0
pkgrel=1
pkgdesc="Custom font based on Star Wars Galactic Basic (Aurebesh/Aurek-Besh) by Tycho_Ordo on theforce.net - Technumbers version"
arch=(any)
url=("http://boards.theforce.net/threads/new-aurebesh-font.50009464")
depends=(fontconfig xorg-font-utils)
source=("https://www.dropbox.com/s/jsdrwvldw71my96/AureTech.otf")
md5sums=("bb97e49bbe9c2a6d32ae96d8458a1ae5")
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 "$srcdir/"*.otf "$pkgdir/usr/share/fonts/OTF/"
} 
