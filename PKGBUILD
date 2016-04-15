#Package cryptojka by JoseluCross and Kprkpr from JKA - Network
#PKGBUILD mantainer: JoseluCross, kprkpr

pkgname=cryptojka
pkgver=0.4.7
pkgrel=5
pkgdesc="de/encryption character by character"
arch=('i686' 'x86_64')
url="http://gitlab.com/JKANetwork/cryptoJKA"
license=('GPL3')
options=(!emptydirs)
source=(https://gitlab.com/JKANetwork/cryptoJKA/raw/master/last-version/$pkgname-$pkgver.tbz2)
md5sums=('7aaf78406794a9f96977b0a776315728')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  make
}
package(){
  mkdir -p "$pkgdir/usr/bin"
  mv "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
}
