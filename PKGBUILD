# Maintainer: Herbert Knapp <herbert.knapp at edu.uni-graz.at>
pkgname=atvrec
pkgver=1.2.2
pkgrel=1
pkgdesc='Command line TV recorder for Austrian TV stations ORF, ATV, Puls4, ServusTV Mediathek and ORF, ServusTV livestreams'
arch=('x86_64')
url='https://twitter.com/hmknapp'
license=('Freeware')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://www.dropbox.com/s/y9gvj9bukfetdlq/$pkgname-$pkgver.tar.gz?dl=1")
md5sums=("fff332361eab8fe6f5b210d7cf030273")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install $pkgname "$pkgdir/usr/bin/"
}
