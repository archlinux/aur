#Package cryptojka by JoseluCross and Kprkpr from JKA - Network
#PKGBUILD mantainer: JoseluCross, kprkpr

pkgname=cryptojka
pkgver=0.4.7
pkgrel=1
pkgdesc="de/encryption character by character"
arch=('i686' 'x86_64')
url="http://gitlab.com/JKANetwork/cryptoJKA"
license=('GPL3')
options=(!emptydirs)
source=(https://gitlab.com/JKANetwork/cryptoJKA/raw/master/last-version/$pkgname-$pkgver.tbz2)
md5sums=('b38967d474fb14582a16938df6897751')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  make
}
package(){
  mkdir -p "$pkgdir/usr/bin"
  mv "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
}
md5sums=('5ccc0952b2efd50cfdfafb2d749a2237')
