# Authors : liliumcruentus and nale12
# Maintainer: Reventlov <nontunauraspasmonmail@gmail.com> 
pkgname=gtk-theme-the-days-of-grays
pkgver=0.2
pkgrel=1
pkgdesc="A dark and usable gtk theme. The days of Grays"
arch=('x86' 'x86_64')
url="http://liliumcruentus.deviantart.com/art/The-Days-of-Grays-158652803"
license=('CCPL:cc-by-nc-sa')
depends=()
source=('http://docs.volcanis.me/_The_Days_of_Grays__by_liliumcruentus.zip')
md5sums=('33025c58d2683cb1c175ef40ef4d5a51')

build() {
  cd "$srcdir/"

  mkdir -p $pkgdir/usr/share/themes/
  cp -r -d "$srcdir/The days of grays" "$pkgdir/usr/share/themes/"
  chmod -R 755 "$pkgdir/usr/share/themes/"
}


