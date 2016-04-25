# Maintainer: Herbert Knapp <herbert.knapp at edu.uni-graz.at>
pkgname=atvrec
pkgver=1.0.1
pkgrel=1
pkgdesc="Tiny TV recorder for Austrian TV stations ORF, ATV, Puls4, ServusTV Mediathek and ORF livestreams"
arch=('x86_64')
url="https://twitter.com/hmknapp"
license=('Freeware')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://www.dropbox.com/s/0gdqkl4sf2q0xos/$pkgname-$pkgver.tar.gz?dl=1")
md5sums=('e125e45d499697d60fffd8a181718518')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install $pkgname "$pkgdir/usr/bin/"
}
