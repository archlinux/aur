# Maintainer: Josef Erben <firstname at lastname dot io>

pkgname=memb
pkgver=0.0.3
pkgrel=1
pkgdesc="A tool to manage a local text-based knowledge base"
url="https://github.com/jerben/memb"
arch=('any')
license=('MIT')
depends=('grep')
source=("https://github.com/jerben/memb/archive/$pkgver.tar.gz")
sha256sums=('e849d1889e4002611547f3a2fed60caead8f70a9ae8677f03610585088c3686c')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 memb "$pkgdir/usr/bin/memb"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
