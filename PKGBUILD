#Package cryptojka by JoseluCross and Kprkpr from JKA - Network
#PKGBUILD mantainer: JoseluCross, Kprkpr

pkgname=cryptojka
pkgver=0.4.11
pkgrel=1
pkgdesc="de/encryption character by character"
arch=('i686' 'x86_64')
url="http://gitlab.com/JKANetwork/cryptoJKA"
license=('GPL3')
options=(!emptydirs)
source=(https://gitlab.com/JKANetwork/cryptoJKA/raw/master/last-version/$pkgname-$pkgver.tbz2)
md5sums=('062802120d4b2555f3c3226cec4a476c')
install=$pkgname.install
build(){
  cd "$srcdir/$pkgname-$pkgver"
  make

}
package(){
  mkdir -p $pkgdir/usr/{bin,share}
  mkdir -p $pkgdir/usr/share/cryptojka/i18n/es/LC_MESSAGES
  cp "$srcdir/$pkgname-$pkgver/src/es.mo" "$pkgdir/usr/share/i18n/es/LC_MESSAGES/cryptojka.mo"
  cp "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
}

