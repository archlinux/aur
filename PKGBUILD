# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=bing-ip2hosts
pkgver=1.0.1
pkgrel=1
pkgdesc='Enumerate hostnames for an IP using bing.com'
arch=('any')
url='http://www.morningstarsecurity.com/research/bing-ip2hosts'
license=('GPL3')
depends=(bash)
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/urbanadventurer/bing-ip2hosts/archive/v1.0.1.tar.gz")
sha256sums=('4994eb78723ba459cfa7b79e58a7b66171ab9c30c768f49e5bc1bf1f9ac696a2')
package(){
  cd "$srcdir"/$pkgname-$pkgver

  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 CHANGELOG "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG
}
