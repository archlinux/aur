pkgname=otf-aurebesh
pkgver=1.1
pkgrel=1
pkgdesc="Custom font based on Star Wars Galactic Basic (Aurebesh/Aurek-Besh) by Tycho_Ordo on theforce.net - Arabic numbers version"
arch=(any)
url=("http://boards.theforce.net/threads/new-aurebesh-font.50009464")
depends=(fontconfig xorg-font-utils)
source=("https://www.dropbox.com/s/pa8oe4idancx9jp/Aurebesh.otf")
md5sums=("6289b7f7548c5977a1df49d3a91cc0f0")
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 "$srcdir/"*.otf "$pkgdir/usr/share/fonts/OTF/"
} 
