# Maintainer: Herbert Knapp <herbert.knapp at edu.uni-graz.at>
pkgname=atvrec
pkgver=1.0.4
pkgrel=1
pkgdesc="Command line TV recorder for Austrian TV stations ORF, ATV, Puls4, ServusTV Mediathek and ORF livestreams"
arch=('x86_64')
url="https://twitter.com/hmknapp"
license=('Freeware')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://www.dropbox.com/s/v57vszfkz62ls8r/$pkgname-$pkgver.tar.gz?dl=1")
md5sums=("3f3eafca3ef84b66f3122959f9387847")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install $pkgname "$pkgdir/usr/bin/"
}
