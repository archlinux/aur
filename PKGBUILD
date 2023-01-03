# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=alive
pkgver=2.0.5
pkgrel=2
pkgdesc="periodic ping program"
url="https://www.gnu.org/software/alive"
arch=('any')
license=("GPL3")
depends=("guile" "iputils")
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/alive/${pkgname}-${pkgver}.tar.lz")
md5sums=('c32f7faf1c8a23beadaf7032b151cc24')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix "${pkgdir}/usr"
  make
 
}

package() {
  cd "$pkgname-$pkgver"

  make install

}
