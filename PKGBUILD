#Package cryptojka by JoseluCross and Kprkpr from JKA - Network
#PKGBUILD mantainer: JoseluCross, kprkpr

pkgname=cryptojka
pkgver=0.4.7
pkgrel=3
pkgdesc="de/encryption character by character"
arch=('i686' 'x86_64')
url="http://gitlab.com/JKANetwork/cryptoJKA"
license=('GPL3')
options=(!emptydirs)
source=(https://gitlab.com/JKANetwork/cryptoJKA/raw/master/last-version/$pkgname-$pkgver.tbz2)
install=$pkgname.install
md5sums=('SKIP')

build(){
cd "$srcdir/$pkgname-$pkgver"
make
}
package(){
mkdir "$pkgdir/usr"
mkdir "$pkgdir/usr/bin"
mv "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
}
