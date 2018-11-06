# Maintainer: Josef Erben <firstname at lastname dot io>

pkgname=memb
pkgver=0.0.4
pkgrel=1
pkgdesc="A tool to manage a local text-based knowledge base"
url="https://github.com/jerben/memb"
arch=('any')
license=('MIT')
depends=('grep' 'sed')
source=("https://github.com/jerben/memb/archive/$pkgver.tar.gz")
sha256sums=('d266cc918fd4e7246d2f96706a42dfce2ea7e58c697625e229af295921b8b4a7')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 memb "$pkgdir/usr/bin/memb"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
