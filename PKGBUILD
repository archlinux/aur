# Maintainer: Herbert Knapp <herbert.knapp at edu.uni-graz.at>
pkgname=atvrec
pkgver=1.1.2
pkgrel=1
pkgdesc="Command line TV recorder for Austrian TV stations ORF, ATV, Puls4, ServusTV Mediathek and ORF, ServusTV livestreams"
arch=('x86_64')
url="https://twitter.com/hmknapp"
license=('Freeware')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://www.dropbox.com/s/rqvz68dcc2egiov/$pkgname-$pkgver.tar.gz?dl=1")
md5sums=("ec9fb43ea6ffb0c00ec373543a9c27d2")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install $pkgname "$pkgdir/usr/bin/"
}
