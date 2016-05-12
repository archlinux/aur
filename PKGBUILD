# Maintainer: Herbert Knapp <herbert.knapp at edu.uni-graz.at>
pkgname=atvrec
pkgver=1.2.0
pkgrel=1
pkgdesc="Command line TV recorder for Austrian TV stations ORF, ATV, Puls4, ServusTV Mediathek and ORF, ServusTV livestreams"
arch=('x86_64')
url="https://twitter.com/hmknapp"
license=('Freeware')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://www.dropbox.com/s/1qbc839siehuqnk/$pkgname-$pkgver.tar.gz?dl=1")
md5sums=("55d1739db576dc2cb1c86cf44bd44160")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install $pkgname "$pkgdir/usr/bin/"
}
