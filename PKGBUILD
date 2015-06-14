# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=xoctave
pkgver=3.5
pkgrel=1
pkgdesc="Free Trial of XOctave application."
arch=('i686' 'x86_64')
url="http://www.xoctave.com/"
license=('unknown')
makedepends=('rpmextract')
source=("http://www.xoctave.com/demo/${pkgname}-${pkgver}-demo-linux-i386.rpm")
md5sums=('62b658ab60233fd8a9980382aab0bd10')

build() {
  cd $srcdir
  rpmextract.sh ${pkgname}-${pkgver}-demo-linux-i386.rpm
} 

package() {
  cp -Rfp "$srcdir/usr" "$pkgdir"/
}