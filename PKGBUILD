# Maintainer: Josef Erben <firstname at lastname dot io>

pkgname=memb
pkgver=0.0.6
pkgrel=1
pkgdesc="A tiny cli tool to manage a local text-based knowledge base"
url="https://github.com/jerben/memb"
arch=('any')
license=('MIT')
depends=('grep' 'sed')
source=("https://github.com/jerben/memb/archive/$pkgver.tar.gz")
sha256sums=('d0cde7a76728d3a80ac4d859f5bfe22389992939cc960fd4fca923c96b3c4e99')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 memb "$pkgdir/usr/bin/memb"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
