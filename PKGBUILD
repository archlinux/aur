# Maintainer:hnchengzong 
pkgname=hn-randfile-rust-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Random file generator CLI tool"
arch=('x86_64')
url="https://github.com/hnchengzong/hn-randfile-rust"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hnchengzong/hn-randfile-rust/releases/download/v$pkgver/hn-randfile-rust-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('12b295d219cbcf6b0bdc22ae888e64555a2aa651caf99824d98470b201b87a2f')
package() {
  cp -r usr/ "$pkgdir/"
}
