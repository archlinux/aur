# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=bing-ip2hosts
pkgver=0.4
pkgrel=1
pkgdesc='Enumerate hostnames for an IP using bing.com'
arch=('any')
url='http://www.morningstarsecurity.com/research/bing-ip2hosts'
license=('GPL3')
depends=(bash)
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::http://www.morningstarsecurity.com/downloads/bing-ip2hosts-${pkgver}.tar.gz")
sha256sums=('9dedb3e6914170fb86b515b8405a38a1577f7119c5265ed94b9d7ac2fb6fc2df')
package(){
  cd "$srcdir"/$pkgname-$pkgver

  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 CHANGELOG "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG
}
