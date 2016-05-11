# Maintainer: Herbert Knapp <herbert.knapp at edu.uni-graz.at>
pkgname=atvrec
pkgver=1.1.4
pkgrel=1
pkgdesc="Command line TV recorder for Austrian TV stations ORF, ATV, Puls4, ServusTV Mediathek and ORF, ServusTV livestreams"
arch=('x86_64')
url="https://twitter.com/hmknapp"
license=('Freeware')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://www.dropbox.com/s/jvvj5n2xan3bd2n/$pkgname-$pkgver.tar.gz?dl=1")
md5sums=("19d0c55863bdabb8d649c7bb608a3e23")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install $pkgname "$pkgdir/usr/bin/"
}
